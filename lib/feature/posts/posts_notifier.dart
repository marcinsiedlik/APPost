import 'dart:async';

import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/mapper/posts/post_response_ui_mapper.dart';
import 'package:appost/base/network/data_source/mapper/user/user_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_response.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/call_state/paged_call_state.dart';
import 'package:appost/base/ui/dialogs/app_dialogs_mixin.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:appost/base/ui/pagination/app_pagination_mixin.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:appost/feature/posts/model/app_bar_menu_action.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsNotifier extends BaseNotifier with AppPaginationMixin, AppDialogsMixin {
  final PostsRepository _postsRepository;
  final UserRepository _userRepository;
  final PostResponseUiMapper _postUiMapper;
  final UserUiMapper _userUiMapper;
  final OauthTokensStorage _tokensStorage;

  PostsNotifier(
    this._postsRepository,
    this._userRepository,
    this._postUiMapper,
    this._userUiMapper,
    this._tokensStorage,
  ) {
    _fetchUserInfo();
    initPagination((page) => _fetchPosts(page: page));
  }

  final List<UiPost> posts = [];

  var userCallState = CallState<UiUser>();
  var postsCallState = PagedCallState<UiPostResponse>();
  var refreshCompleter = Completer<void>();

  var filterText = '';

  void _fetchUserInfo() async {
    dispatch<UiUser>(
      callState: userCallState,
      block: () async {
        final user = await _userRepository.getLoggedUserInfo();
        return _userUiMapper.mapToUi(user);
      },
      onSuccess: (data) {
        _fetchPosts(page: 0);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void _fetchPosts({@required int page}) async {
    refreshCompleter = Completer<void>();
    dispatch<UiPostResponse>(
      pagedCallState: postsCallState,
      additionalFetch: page > 0,
      block: () async {
        final posts = await _postsRepository.getPosts(
          page: page,
          userNick: filterText,
        );
        return _postUiMapper.mapToUi(posts);
      },
      onSuccess: (data) {
        refreshCompleter.complete();
        onPagedRequestSuccess(first: data.first, last: data.last);
        posts.addAll(data.posts);
      },
      onError: (e) {
        refreshCompleter.complete();
        RouterExtensions.showErrorFlushbar(e);
      },
    );
  }

  Future<void> onRefreshed() {
    _updateFilterAndCallRequest(updatedFilterText: filterText);
    return refreshCompleter.future;
  }

  void onAvatarClicked() {
    if (userCallState.isSuccessful) {
      ExtendedNavigator.ofRouter<Router>().pushUserProfileScreen(userId: userCallState.data.id);
    }
  }

  void onPostClicked(UiPost post) {
    ExtendedNavigator.ofRouter<Router>().pushPostDetailsScreen(postId: post.id);
  }

  void onFabPressed() async {
    final added = await ExtendedNavigator.ofRouter<Router>().pushNewPostScreen();
    if (added != null) {
      _updateFilterAndCallRequest(updatedFilterText: filterText);
    }
  }

  void onMenuItemClicked(BuildContext context, AppBarMenuAction action) {
    action.when(
      logout: () => _handleLogout(),
      removeAccount: () => _handleRemoveUser(context),
    );
  }

  void _handleLogout() {
    _tokensStorage.clearTokens();
    ExtendedNavigator.ofRouter<Router>().pushNamedAndRemoveUntil(Routes.loginScreen, (_) => false);
  }

  void _handleRemoveUser(BuildContext context) async {
    final shouldRemove = await showYesNoDialog(
      context: context,
      messageKey: 'remove_message',
    );
    if (shouldRemove) {}
  }

  void onSearchChanged(String text) {
    if (text == filterText) {
      return;
    }
    _updateFilterAndCallRequest(updatedFilterText: text);
  }

  void _updateFilterAndCallRequest({@required String updatedFilterText}) {
    filterText = updatedFilterText;
    posts.clear();
    resetCurrentPage();
    _fetchPosts(page: 0);
  }

  @override
  void dispose() {
    pagedScrollController.dispose();
    super.dispose();
  }
}
