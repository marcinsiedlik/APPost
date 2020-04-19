import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_user.freezed.dart';

part 'network_user.g.dart';

@freezed
abstract class NetworkUser with _$NetworkUser {
  const factory NetworkUser({
    @required int id,
    @required String email,
    @required String nick,
    @required String firstName,
    @required String lastName,
    @required String place,
  }) = _NetworkUser;

  factory NetworkUser.fromJson(Map<String, dynamic> json) => _$NetworkUserFromJson(json);
}
