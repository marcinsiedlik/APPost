import 'package:appost/base/annotations/di_annotations.dart';
import 'package:appost/base/app/app_constants.dart' as constants;
import 'package:appost/base/network/interceptor/bearer_token_interceptor.dart';
import 'package:appost/base/network/interceptor/connectivity_interceptor.dart';
import 'package:appost/base/network/interceptor/language_interceptor.dart';
import 'package:appost/base/network/interceptor/logger_interceptor.dart';
import 'package:appost/base/network/interceptor/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio
      ..options.baseUrl = constants.baseUrl
      ..interceptors.addAll([
        BearerTokenInterceptor(),
        RefreshTokenInterceptor(dio),
        LoggerInterceptor(),
        ConnectivityInterceptor(),
        LanguageInterceptor(),
      ]);
    return dio;
  }

  @lazySingleton
  @tokenClient
  Dio get tokenDio => Dio()
    ..options.baseUrl = constants.baseUrl
    ..interceptors.addAll([
      LoggerInterceptor(),
      LanguageInterceptor(),
      ConnectivityInterceptor(),
    ]);
}
