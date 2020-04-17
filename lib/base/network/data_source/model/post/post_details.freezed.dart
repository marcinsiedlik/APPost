// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'post_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

PostDetails _$PostDetailsFromJson(Map<String, dynamic> json) {
  return _PostDetails.fromJson(json);
}

class _$PostDetailsTearOff {
  const _$PostDetailsTearOff();

  _PostDetails call(
      {@required int id,
      @required int userId,
      @required String userNick,
      @required int creationDate,
      @required String title,
      @required String description}) {
    return _PostDetails(
      id: id,
      userId: userId,
      userNick: userNick,
      creationDate: creationDate,
      title: title,
      description: description,
    );
  }
}

// ignore: unused_element
const $PostDetails = _$PostDetailsTearOff();

mixin _$PostDetails {
  int get id;

  int get userId;

  String get userNick;

  int get creationDate;

  String get title;

  String get description;

  Map<String, dynamic> toJson();

  $PostDetailsCopyWith<PostDetails> get copyWith;
}

abstract class $PostDetailsCopyWith<$Res> {
  factory $PostDetailsCopyWith(PostDetails value, $Res Function(PostDetails) then) = _$PostDetailsCopyWithImpl<$Res>;

  $Res call({int id, int userId, String userNick, int creationDate, String title, String description});
}

class _$PostDetailsCopyWithImpl<$Res> implements $PostDetailsCopyWith<$Res> {
  _$PostDetailsCopyWithImpl(this._value, this._then);

  final PostDetails _value;

  // ignore: unused_field
  final $Res Function(PostDetails) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userId = freezed,
    Object userNick = freezed,
    Object creationDate = freezed,
    Object title = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      userId: userId == freezed ? _value.userId : userId as int,
      userNick: userNick == freezed ? _value.userNick : userNick as String,
      creationDate: creationDate == freezed ? _value.creationDate : creationDate as int,
      title: title == freezed ? _value.title : title as String,
      description: description == freezed ? _value.description : description as String,
    ));
  }
}

abstract class _$PostDetailsCopyWith<$Res> implements $PostDetailsCopyWith<$Res> {
  factory _$PostDetailsCopyWith(_PostDetails value, $Res Function(_PostDetails) then) =
      __$PostDetailsCopyWithImpl<$Res>;

  @override
  $Res call({int id, int userId, String userNick, int creationDate, String title, String description});
}

class __$PostDetailsCopyWithImpl<$Res> extends _$PostDetailsCopyWithImpl<$Res> implements _$PostDetailsCopyWith<$Res> {
  __$PostDetailsCopyWithImpl(_PostDetails _value, $Res Function(_PostDetails) _then)
      : super(_value, (v) => _then(v as _PostDetails));

  @override
  _PostDetails get _value => super._value as _PostDetails;

  @override
  $Res call({
    Object id = freezed,
    Object userId = freezed,
    Object userNick = freezed,
    Object creationDate = freezed,
    Object title = freezed,
    Object description = freezed,
  }) {
    return _then(_PostDetails(
      id: id == freezed ? _value.id : id as int,
      userId: userId == freezed ? _value.userId : userId as int,
      userNick: userNick == freezed ? _value.userNick : userNick as String,
      creationDate: creationDate == freezed ? _value.creationDate : creationDate as int,
      title: title == freezed ? _value.title : title as String,
      description: description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()
class _$_PostDetails implements _PostDetails {
  const _$_PostDetails(
      {@required this.id,
      @required this.userId,
      @required this.userNick,
      @required this.creationDate,
      @required this.title,
      @required this.description})
      : assert(id != null),
        assert(userId != null),
        assert(userNick != null),
        assert(creationDate != null),
        assert(title != null),
        assert(description != null);

  factory _$_PostDetails.fromJson(Map<String, dynamic> json) => _$_$_PostDetailsFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String userNick;
  @override
  final int creationDate;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'PostDetails(id: $id, userId: $userId, userNick: $userNick, creationDate: $creationDate, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostDetails &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) || const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userNick, userNick) || const DeepCollectionEquality().equals(other.userNick, userNick)) &&
            (identical(other.creationDate, creationDate) ||
                const DeepCollectionEquality().equals(other.creationDate, creationDate)) &&
            (identical(other.title, title) || const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userNick) ^
      const DeepCollectionEquality().hash(creationDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$PostDetailsCopyWith<_PostDetails> get copyWith => __$PostDetailsCopyWithImpl<_PostDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostDetailsToJson(this);
  }
}

abstract class _PostDetails implements PostDetails {
  const factory _PostDetails(
      {@required int id,
      @required int userId,
      @required String userNick,
      @required int creationDate,
      @required String title,
      @required String description}) = _$_PostDetails;

  factory _PostDetails.fromJson(Map<String, dynamic> json) = _$_PostDetails.fromJson;

  @override
  int get id;

  @override
  int get userId;

  @override
  String get userNick;

  @override
  int get creationDate;

  @override
  String get title;

  @override
  String get description;

  @override
  _$PostDetailsCopyWith<_PostDetails> get copyWith;
}
