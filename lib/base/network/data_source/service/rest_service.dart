import 'package:appost/base/annotations/retrofit_annotations.dart';
import 'package:appost/base/network/data_source/model/post/post_details.dart';
import 'package:appost/base/network/data_source/model/register_dto.dart';
import 'package:appost/base/network/data_source/model/user_dto.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class RestService {
  @POST('/user/register')
  Future<UserDto> register(@Body() RegisterDto registerDto);

  @baseAuth
  @FormUrlEncoded()
  @POST('/oauth/token')
  Future<TokensResponse> login(
    @Field('username') String email,
    @Field('password') String password,
    @Field('grant_type') String grantType,
  );

  @secured
  @GET('/post/1')
  Future<PostDetails> getPostDetails();

  @factoryMethod
  factory RestService(Dio dio) = _RestService;
}
