import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/mapper/posts/post_response_ui_mapper.dart';
import 'package:appost/base/network/data_source/mapper/user/user_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_response.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/call_state/paged_call_state.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:appost/base/ui/pagination/app_pagination_mixin.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserProfileNotifier extends BaseNotifier with AppPaginationMixin {
  final UserRepository _userRepository;
  final PostsRepository _postsRepository;
  final UserUiMapper _userMapper;
  final PostResponseUiMapper _postMapper;
  final int _userId;

  UserProfileNotifier(
    this._userRepository,
    this._postsRepository,
    this._userMapper,
    this._postMapper,
    @factoryParam this._userId,
  ) {
    _fetchUser();
  }

  final List<UiPost> posts = [];

  var userState = CallState<UiUser>();
  var postsState = PagedCallState<UiPostResponse>();
  var _userNick = '';

  void _fetchUser() async {
    dispatch<UiUser>(
      callState: userState,
      block: () async {
        final user = await _userRepository.getUserInfo(userId: _userId);
        return _userMapper.mapToUi(user);
      },
      onSuccess: (data) {
        _userNick = data.nick;
        _fetchPosts(page: 0);
        initPagination((page) => _fetchPosts(page: page));
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void _fetchPosts({@required int page}) async {
    dispatch<UiPostResponse>(
      pagedCallState: postsState,
      additionalFetch: page > 0,
      block: () async {
        final posts = await _postsRepository.getPosts(
          page: page,
          userNick: _userNick,
        );
        return _postMapper.mapToUi(posts);
      },
      onSuccess: (data) {
        onPagedRequestSuccess(first: data.first, last: data.last);
        posts.addAll(data.posts);
      },
    );
  }

  void onPostClicked(UiPost post) {
    ExtendedNavigator.ofRouter<Router>().pushPostDetailsScreen(postId: post.id);
  }

  @override
  void dispose() {
    pagedScrollController.dispose();
    super.dispose();
  }
}
