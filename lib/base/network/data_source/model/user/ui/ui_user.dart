import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_user.freezed.dart';

part 'ui_user.g.dart';

@freezed
abstract class UiUser with _$UiUser {
  const factory UiUser({
    @required int id,
    @required String email,
    @required String nick,
    @required String firstName,
    @required String lastName,
    @required String place,
  }) = _UiUser;

  factory UiUser.fromJson(Map<String, dynamic> json) => _$UiUserFromJson(json);
}
