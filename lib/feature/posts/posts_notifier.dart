import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/mapper/posts/post_response_ui_mapper.dart';
import 'package:appost/base/network/data_source/mapper/user/user_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsNotifier extends BaseNotifier {
  final PostsRepository _postsRepository;
  final UserRepository _userRepository;
  final PostResponseUiMapper _postUiMapper;
  final UserUiMapper _userUiMapper;

  PostsNotifier(this._postsRepository, this._userRepository, this._postUiMapper, this._userUiMapper) {
    _fetchUserInfo();
  }

  var userCallState = CallState<UiUser>();

  void _fetchUserInfo() async {
    dispatch(
      callState: userCallState,
      block: () async {
        final response = await _userRepository.getLoggedUserInfo();
        return _userUiMapper.mapToUi(response);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onSearchChanged(String text) {}

  void onAvatarClicked() {}
}
