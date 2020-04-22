import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/mapper/user/user_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserProfileNotifier extends BaseNotifier {
  final UserRepository _repository;
  final UserUiMapper _uiMapper;
  final int _userId;

  UserProfileNotifier(
    this._repository,
    this._uiMapper,
    @factoryParam this._userId,
  ) {
    _fetchUser();
  }

  var userState = CallState<UiUser>();

  void _fetchUser() async {
    dispatch<UiUser>(
      callState: userState,
      block: () async {
        final user = await _repository.getUserInfo(userId: _userId);
        return _uiMapper.mapToUi(user);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }
}
