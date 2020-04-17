// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'tokens_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TokensResponse _$TokensResponseFromJson(Map<String, dynamic> json) {
  return _TokensResponse.fromJson(json);
}

class _$TokensResponseTearOff {
  const _$TokensResponseTearOff();

  _TokensResponse call(
      {@required @JsonKey(name: 'access_token') String accessToken,
      @required @JsonKey(name: 'token_type') String tokenType,
      @required @JsonKey(name: 'refresh_token') String refreshToken,
      @required @JsonKey(name: 'expires_in') int expiresIn,
      @required String scope}) {
    return _TokensResponse(
      accessToken: accessToken,
      tokenType: tokenType,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
      scope: scope,
    );
  }
}

// ignore: unused_element
const $TokensResponse = _$TokensResponseTearOff();

mixin _$TokensResponse {
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'token_type')
  String get tokenType;
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  String get scope;

  Map<String, dynamic> toJson();
  $TokensResponseCopyWith<TokensResponse> get copyWith;
}

abstract class $TokensResponseCopyWith<$Res> {
  factory $TokensResponseCopyWith(TokensResponse value, $Res Function(TokensResponse) then) =
      _$TokensResponseCopyWithImpl<$Res>;

  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expires_in') int expiresIn,
      String scope});
}

class _$TokensResponseCopyWithImpl<$Res>
    implements $TokensResponseCopyWith<$Res> {
  _$TokensResponseCopyWithImpl(this._value, this._then);

  final TokensResponse _value;

  // ignore: unused_field
  final $Res Function(TokensResponse) _then;

  @override
  $Res call({
    Object accessToken = freezed,
    Object tokenType = freezed,
    Object refreshToken = freezed,
    Object expiresIn = freezed,
    Object scope = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
      accessToken == freezed ? _value.accessToken : accessToken as String,
      tokenType: tokenType == freezed ? _value.tokenType : tokenType as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      expiresIn: expiresIn == freezed ? _value.expiresIn : expiresIn as int,
      scope: scope == freezed ? _value.scope : scope as String,
    ));
  }
}

abstract class _$TokensResponseCopyWith<$Res>
    implements $TokensResponseCopyWith<$Res> {
  factory _$TokensResponseCopyWith(_TokensResponse value, $Res Function(_TokensResponse) then) =
  __$TokensResponseCopyWithImpl<$Res>;

  @override
  $Res call({@JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'expires_in') int expiresIn,
    String scope});
}

class __$TokensResponseCopyWithImpl<$Res> extends _$TokensResponseCopyWithImpl<$Res>
    implements _$TokensResponseCopyWith<$Res> {
  __$TokensResponseCopyWithImpl(_TokensResponse _value, $Res Function(_TokensResponse) _then)
      : super(_value, (v) => _then(v as _TokensResponse));

  @override
  _TokensResponse get _value => super._value as _TokensResponse;

  @override
  $Res call({
    Object accessToken = freezed,
    Object tokenType = freezed,
    Object refreshToken = freezed,
    Object expiresIn = freezed,
    Object scope = freezed,
  }) {
    return _then(_TokensResponse(
      accessToken:
      accessToken == freezed ? _value.accessToken : accessToken as String,
      tokenType: tokenType == freezed ? _value.tokenType : tokenType as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      expiresIn: expiresIn == freezed ? _value.expiresIn : expiresIn as int,
      scope: scope == freezed ? _value.scope : scope as String,
    ));
  }
}

@JsonSerializable()
class _$_TokensResponse implements _TokensResponse {
  const _$_TokensResponse(
      {@required @JsonKey(name: 'access_token') this.accessToken,
        @required @JsonKey(name: 'token_type') this.tokenType,
        @required @JsonKey(name: 'refresh_token') this.refreshToken,
        @required @JsonKey(name: 'expires_in') this.expiresIn,
        @required this.scope})
      : assert(accessToken != null),
        assert(tokenType != null),
        assert(refreshToken != null),
        assert(expiresIn != null),
        assert(scope != null);

  factory _$_TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_TokensResponseFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @override
  final String scope;

  @override
  String toString() {
    return 'TokensResponse(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, scope: $scope)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TokensResponse &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(scope);

  @override
  _$TokensResponseCopyWith<_TokensResponse> get copyWith =>
      __$TokensResponseCopyWithImpl<_TokensResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokensResponseToJson(this);
  }
}

abstract class _TokensResponse implements TokensResponse {
  const factory _TokensResponse({@required @JsonKey(name: 'access_token') String accessToken,
    @required @JsonKey(name: 'token_type') String tokenType,
    @required @JsonKey(name: 'refresh_token') String refreshToken,
    @required @JsonKey(name: 'expires_in') int expiresIn,
    @required String scope}) = _$_TokensResponse;

  factory _TokensResponse.fromJson(Map<String, dynamic> json) =
  _$_TokensResponse.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;

  @override
  @JsonKey(name: 'token_type')
  String get tokenType;

  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override
  String get scope;
  @override
  _$TokensResponseCopyWith<_TokensResponse> get copyWith;
}
