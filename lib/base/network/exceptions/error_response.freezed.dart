// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return _ErrorResponse.fromJson(json);
}

class _$ErrorResponseTearOff {
  const _$ErrorResponseTearOff();

  _ErrorResponse call({int code, String developerMessage, String printableMessage}) {
    return _ErrorResponse(
      code: code,
      developerMessage: developerMessage,
      printableMessage: printableMessage,
    );
  }
}

// ignore: unused_element
const $ErrorResponse = _$ErrorResponseTearOff();

mixin _$ErrorResponse {
  int get code;
  String get developerMessage;
  String get printableMessage;

  Map<String, dynamic> toJson();
  $ErrorResponseCopyWith<ErrorResponse> get copyWith;
}

abstract class $ErrorResponseCopyWith<$Res> {
  factory $ErrorResponseCopyWith(ErrorResponse value, $Res Function(ErrorResponse) then) =
      _$ErrorResponseCopyWithImpl<$Res>;

  $Res call({int code, String developerMessage, String printableMessage});
}

class _$ErrorResponseCopyWithImpl<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  final ErrorResponse _value;

  // ignore: unused_field
  final $Res Function(ErrorResponse) _then;

  @override
  $Res call({
    Object code = freezed,
    Object developerMessage = freezed,
    Object printableMessage = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as int,
      developerMessage: developerMessage == freezed
          ? _value.developerMessage
          : developerMessage as String,
      printableMessage: printableMessage == freezed
          ? _value.printableMessage
          : printableMessage as String,
    ));
  }
}

abstract class _$ErrorResponseCopyWith<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  factory _$ErrorResponseCopyWith(_ErrorResponse value, $Res Function(_ErrorResponse) then) =
  __$ErrorResponseCopyWithImpl<$Res>;

  @override
  $Res call({int code, String developerMessage, String printableMessage});
}

class __$ErrorResponseCopyWithImpl<$Res> extends _$ErrorResponseCopyWithImpl<$Res>
    implements _$ErrorResponseCopyWith<$Res> {
  __$ErrorResponseCopyWithImpl(_ErrorResponse _value, $Res Function(_ErrorResponse) _then)
      : super(_value, (v) => _then(v as _ErrorResponse));

  @override
  _ErrorResponse get _value => super._value as _ErrorResponse;

  @override
  $Res call({
    Object code = freezed,
    Object developerMessage = freezed,
    Object printableMessage = freezed,
  }) {
    return _then(_ErrorResponse(
      code: code == freezed ? _value.code : code as int,
      developerMessage: developerMessage == freezed
          ? _value.developerMessage
          : developerMessage as String,
      printableMessage: printableMessage == freezed
          ? _value.printableMessage
          : printableMessage as String,
    ));
  }
}

@JsonSerializable()
class _$_ErrorResponse implements _ErrorResponse {
  const _$_ErrorResponse({this.code, this.developerMessage, this.printableMessage});

  factory _$_ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorResponseFromJson(json);

  @override
  final int code;
  @override
  final String developerMessage;
  @override
  final String printableMessage;

  @override
  String toString() {
    return 'ErrorResponse(code: $code, developerMessage: $developerMessage, printableMessage: $printableMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorResponse &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.developerMessage, developerMessage) ||
                const DeepCollectionEquality()
                    .equals(other.developerMessage, developerMessage)) &&
            (identical(other.printableMessage, printableMessage) ||
                const DeepCollectionEquality()
                    .equals(other.printableMessage, printableMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(developerMessage) ^
      const DeepCollectionEquality().hash(printableMessage);

  @override
  _$ErrorResponseCopyWith<_ErrorResponse> get copyWith =>
      __$ErrorResponseCopyWithImpl<_ErrorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ErrorResponseToJson(this);
  }
}

abstract class _ErrorResponse implements ErrorResponse {
  const factory _ErrorResponse({int code,
    String developerMessage,
    String printableMessage}) = _$_ErrorResponse;

  factory _ErrorResponse.fromJson(Map<String, dynamic> json) =
  _$_ErrorResponse.fromJson;

  @override
  int get code;

  @override
  String get developerMessage;

  @override
  String get printableMessage;

  @override
  _$ErrorResponseCopyWith<_ErrorResponse> get copyWith;
}
