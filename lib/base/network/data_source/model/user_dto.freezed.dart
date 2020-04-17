// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

class _$UserDtoTearOff {
  const _$UserDtoTearOff();

  _UserDto call({int id, String email, String nick, String firstName, String lastName, String place}) {
    return _UserDto(
      id: id,
      email: email,
      nick: nick,
      firstName: firstName,
      lastName: lastName,
      place: place,
    );
  }
}

// ignore: unused_element
const $UserDto = _$UserDtoTearOff();

mixin _$UserDto {
  int get id;
  String get email;
  String get nick;
  String get firstName;
  String get lastName;
  String get place;

  Map<String, dynamic> toJson();
  $UserDtoCopyWith<UserDto> get copyWith;
}

abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
  _$UserDtoCopyWithImpl<$Res>;

  $Res call({int id,
    String email,
    String nick,
    String firstName,
    String lastName,
    String place});
}

class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object nick = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object place = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      email: email == freezed ? _value.email : email as String,
      nick: nick == freezed ? _value.nick : nick as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      place: place == freezed ? _value.place : place as String,
    ));
  }
}

abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
  __$UserDtoCopyWithImpl<$Res>;

  @override
  $Res call({int id,
    String email,
    String nick,
    String firstName,
    String lastName,
    String place});
}

class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object nick = freezed,
    Object firstName = freezed,
    Object lastName = freezed,
    Object place = freezed,
  }) {
    return _then(_UserDto(
      id: id == freezed ? _value.id : id as int,
      email: email == freezed ? _value.email : email as String,
      nick: nick == freezed ? _value.nick : nick as String,
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      place: place == freezed ? _value.place : place as String,
    ));
  }
}

@JsonSerializable()
class _$_UserDto implements _UserDto {
  const _$_UserDto({this.id,
    this.email,
    this.nick,
    this.firstName,
    this.lastName,
    this.place});

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDtoFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String nick;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String place;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, nick: $nick, firstName: $firstName, lastName: $lastName, place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.nick, nick) ||
                const DeepCollectionEquality().equals(other.nick, nick)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(nick) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(place);

  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDtoToJson(this);
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto({int id,
    String email,
    String nick,
    String firstName,
    String lastName,
    String place}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  int get id;

  @override
  String get email;

  @override
  String get nick;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get place;
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith;
}
