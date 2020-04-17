// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) {
  return _RegisterDto.fromJson(json);
}

class _$RegisterDtoTearOff {
  const _$RegisterDtoTearOff();

  _RegisterDto call(
      {String email,
      String nick,
      String password,
      String repeatedPassword,
      String firstName,
      String lastName,
      String place}) {
    return _RegisterDto(
      email: email,
      nick: nick,
      password: password,
      repeatedPassword: repeatedPassword,
      firstName: firstName,
      lastName: lastName,
      place: place,
    );
  }
}

// ignore: unused_element
const $RegisterDto = _$RegisterDtoTearOff();

mixin _$RegisterDto {
  String get email;
  String get nick;
  String get password;
  String get repeatedPassword;
  String get firstName;
  String get lastName;
  String get place;

  Map<String, dynamic> toJson();
  $RegisterDtoCopyWith<RegisterDto> get copyWith;
}

abstract class $RegisterDtoCopyWith<$Res> {
  factory $RegisterDtoCopyWith(RegisterDto value, $Res Function(RegisterDto) then) = _$RegisterDtoCopyWithImpl<$Res>;

  $Res call(
      {String email,
      String nick,
      String password,
      String repeatedPassword,
      String firstName,
      String lastName,
      String place});
}

class _$RegisterDtoCopyWithImpl<$Res> implements $RegisterDtoCopyWith<$Res> {
  _$RegisterDtoCopyWithImpl(this._value, this._then);

  final RegisterDto _value;
  // ignore: unused_field
  final $Res Function(RegisterDto) _then;

  @override
  $Res call({
    Object email = freezed,
    Object nick = freezed,
    Object password = freezed,
    Object repeatedPassword = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object place = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      nick: nick == freezed ? _value.nick : nick as String,
      password: password == freezed ? _value.password : password as String,
      repeatedPassword: repeatedPassword == freezed
          ? _value.repeatedPassword
          : repeatedPassword as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      place: place == freezed ? _value.place : place as String,
    ));
  }
}

abstract class _$RegisterDtoCopyWith<$Res>
    implements $RegisterDtoCopyWith<$Res> {
  factory _$RegisterDtoCopyWith(_RegisterDto value, $Res Function(_RegisterDto) then) =
  __$RegisterDtoCopyWithImpl<$Res>;

  @override
  $Res call({String email,
    String nick,
    String password,
    String repeatedPassword,
    String firstName,
    String lastName,
    String place});
}

class __$RegisterDtoCopyWithImpl<$Res> extends _$RegisterDtoCopyWithImpl<$Res>
    implements _$RegisterDtoCopyWith<$Res> {
  __$RegisterDtoCopyWithImpl(_RegisterDto _value, $Res Function(_RegisterDto) _then)
      : super(_value, (v) => _then(v as _RegisterDto));

  @override
  _RegisterDto get _value => super._value as _RegisterDto;

  @override
  $Res call({
    Object email = freezed,
    Object nick = freezed,
    Object password = freezed,
    Object repeatedPassword = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object place = freezed,
  }) {
    return _then(_RegisterDto(
      email: email == freezed ? _value.email : email as String,
      nick: nick == freezed ? _value.nick : nick as String,
      password: password == freezed ? _value.password : password as String,
      repeatedPassword: repeatedPassword == freezed
          ? _value.repeatedPassword
          : repeatedPassword as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      place: place == freezed ? _value.place : place as String,
    ));
  }
}

@JsonSerializable()
class _$_RegisterDto implements _RegisterDto {
  const _$_RegisterDto({this.email,
    this.nick,
    this.password,
    this.repeatedPassword,
    this.firstName,
    this.lastName,
    this.place});

  factory _$_RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$_$_RegisterDtoFromJson(json);

  @override
  final String email;
  @override
  final String nick;
  @override
  final String password;
  @override
  final String repeatedPassword;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String place;

  @override
  String toString() {
    return 'RegisterDto(email: $email, nick: $nick, password: $password, repeatedPassword: $repeatedPassword, firstName: $firstName, lastName: $lastName, place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.nick, nick) ||
                const DeepCollectionEquality().equals(other.nick, nick)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.repeatedPassword, repeatedPassword) ||
                const DeepCollectionEquality()
                    .equals(other.repeatedPassword, repeatedPassword)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(nick) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(repeatedPassword) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(place);

  @override
  _$RegisterDtoCopyWith<_RegisterDto> get copyWith =>
      __$RegisterDtoCopyWithImpl<_RegisterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegisterDtoToJson(this);
  }
}

abstract class _RegisterDto implements RegisterDto {
  const factory _RegisterDto({String email,
    String nick,
    String password,
    String repeatedPassword,
    String firstName,
    String lastName,
    String place}) = _$_RegisterDto;

  factory _RegisterDto.fromJson(Map<String, dynamic> json) =
  _$_RegisterDto.fromJson;

  @override
  String get email;

  @override
  String get nick;

  @override
  String get password;

  @override
  String get repeatedPassword;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get place;
  @override
  _$RegisterDtoCopyWith<_RegisterDto> get copyWith;
}
