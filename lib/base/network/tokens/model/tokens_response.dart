import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_response.freezed.dart';

part 'tokens_response.g.dart';

@freezed
abstract class TokensResponse with _$TokensResponse {
  const factory TokensResponse({
    @JsonKey(name: 'access_token') @required String accessToken,
    @JsonKey(name: 'token_type') @required String tokenType,
    @JsonKey(name: 'refresh_token') @required String refreshToken,
    @JsonKey(name: 'expires_in') @required int expiresIn,
    @required String scope,
  }) = _TokensResponse;

  factory TokensResponse.fromJson(Map<String, dynamic> json) => _$TokensResponseFromJson(json);
}
