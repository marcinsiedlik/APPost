import 'dart:async';

import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/network/exceptions/api_exception.dart';
import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:appost/base/network/tokens/repository/refresh_token_repository.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final _tokensStorage = getIt<OauthTokensStorage>();
  final Dio _dio;

  RefreshTokenInterceptor(this._dio);

  @override
  Future onError(DioError err) async {
    if (!_isUnauthorizedError(err)) {
      return err;
    }
    try {
      final refreshResponse = await _refreshTokens(_tokensStorage.refreshToken);
      _saveTokens(refreshResponse);
    } catch (e) {
      return err;
    }
    return _createUpdatedRequest(err.request);
  }

  Future<TokensResponse> _refreshTokens(String refreshToken) {
    final repository = getIt<RefreshTokenRepository>();

    if (refreshToken == null) {
      return Future.error(UnauthorizedException('401', null, null));
    }
    return repository.refreshTokens(refreshToken);
  }

  void _saveTokens(TokensResponse tokensResponse) =>
      _tokensStorage.saveTokens(tokensResponse.accessToken, tokensResponse.refreshToken);

  bool _isUnauthorizedError(DioError err) => err.response?.statusCode == 401;

  Future _createUpdatedRequest(RequestOptions request) => _dio.request(
        request.path,
        cancelToken: request.cancelToken,
        data: request.data,
        onReceiveProgress: request.onReceiveProgress,
        onSendProgress: request.onSendProgress,
        queryParameters: request.queryParameters,
        options: request..headers[headers.authorizationKey] = '${headers.bearerPrefix} ${_tokensStorage.accessToken}',
      );
}
