import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:appost/base/network/repository/base_repository.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:appost/base/network/tokens/repository/refresh_token_repository.dart';
import 'package:appost/base/network/tokens/service/refresh_token_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@RegisterAs(RefreshTokenRepository)
class RefreshTokenRepositoryImpl extends BaseRepository implements RefreshTokenRepository {
  final RefreshTokenService _service;

  RefreshTokenRepositoryImpl(this._service);

  @override
  Future<TokensResponse> refreshTokens(String refreshToken, {String grantType = headers.refreshTokenGrantType}) =>
      call(() => _service.refreshTokens(refreshToken, grantType));
}
