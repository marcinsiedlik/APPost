import 'package:appost/base/annotations/di_annotations.dart';
import 'package:appost/base/annotations/retrofit_annotations.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'refresh_token_service.g.dart';

@lazySingleton
@RestApi()
abstract class RefreshTokenService {
  @baseAuth
  @FormUrlEncoded()
  @POST('/oauth/token')
  Future<TokensResponse> refreshTokens(
    @Field('refresh_token') String refreshToken,
    @Field('grant_type') String grantType,
  );

  @factoryMethod
  factory RefreshTokenService(@tokenClient Dio dio) = _RefreshTokenService;
}
