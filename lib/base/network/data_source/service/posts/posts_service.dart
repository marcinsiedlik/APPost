import 'package:appost/base/annotations/retrofit_annotations.dart';
import 'package:appost/base/network/data_source/model/posts/network/network_post_details.dart';
import 'package:appost/base/network/data_source/model/posts/network/network_post_response.dart';
import 'package:appost/base/network/data_source/model/posts/network/new_post_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service.g.dart';

@lazySingleton
@RestApi()
abstract class PostsService {
  @secured
  @GET('/post/list')
  Future<NetworkPostResponse> getPosts(
    @Query('page') int page,
    @Query('userNick') String userNick,
  );

  @secured
  @GET('/post/{id}')
  Future<NetworkPostDetails> getPostDetails(@Path('id') int postId);

  @secured
  @POST('/post/new')
  Future<void> addNewPost(@Body() NewPostModel model);

  @factoryMethod
  factory PostsService(Dio dio) = _PostsService;
}
