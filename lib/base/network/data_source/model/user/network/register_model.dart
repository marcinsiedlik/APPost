import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
abstract class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @required String email,
    @required String nick,
    @required String password,
    @required String repeatedPassword,
    @required String firstName,
    @required String lastName,
    @required String place,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
}
