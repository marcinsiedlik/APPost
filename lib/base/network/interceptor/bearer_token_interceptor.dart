import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:dio/dio.dart';

class BearerTokenInterceptor extends InterceptorsWrapper {
  final _tokensStorage = getIt<OauthTokensStorage>();

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    final accessToken = _tokensStorage.accessToken;

    if (accessToken != null && _isRequestSecured(options)) {
      options.headers
        ..putIfAbsent(headers.authorizationKey, () => '${headers.bearerPrefix} $accessToken')
        ..remove(headers.securedKey);
    }
    return options;
  }

  bool _isRequestSecured(RequestOptions options) => options.headers.containsKey(headers.securedKey);
}
