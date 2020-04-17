import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.freezed.dart';

part 'register_dto.g.dart';

@freezed
abstract class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    String email,
    String nick,
    String password,
    String repeatedPassword,
    String firstName,
    String lastName,
    String place,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);
}
