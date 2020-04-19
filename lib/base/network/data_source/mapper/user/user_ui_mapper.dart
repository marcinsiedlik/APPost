import 'package:appost/base/network/data_source/model/user/network/network_user.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/network/mapper/ui_mapper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserUiMapper implements UiMapper<NetworkUser, UiUser> {
  @override
  UiUser mapToUi(NetworkUser network) => UiUser(
        id: network.id,
        email: network.email,
        nick: network.nick,
        firstName: network.firstName,
        lastName: network.lastName,
        place: network.place,
      );
}
