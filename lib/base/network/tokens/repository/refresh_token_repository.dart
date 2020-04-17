import 'package:appost/base/network/tokens/model/tokens_response.dart';

abstract class RefreshTokenRepository {
  Future<TokensResponse> refreshTokens(String refreshToken, {String grantType});
}
