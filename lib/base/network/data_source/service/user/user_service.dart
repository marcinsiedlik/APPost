import 'package:appost/base/annotations/retrofit_annotations.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@lazySingleton
@RestApi()
abstract class UserService {
  @baseAuth
  @FormUrlEncoded()
  @POST('/oauth/token')
  Future<TokensResponse> login(
    @Field('username') String email,
    @Field('password') String password,
    @Field('grant_type') String grantType,
  );

  @factoryMethod
  factory UserService(Dio dio) = _UserService;
}
