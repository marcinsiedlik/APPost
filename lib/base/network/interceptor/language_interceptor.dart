import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:dio/dio.dart';

class LanguageInterceptor extends InterceptorsWrapper {
  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return options
      ..headers[headers.languageKey] = headers.languageCodeValue
      ..queryParameters[headers.languageCode] = headers.languageCodeValue;
  }
}
