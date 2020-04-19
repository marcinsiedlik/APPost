import 'package:appost/base/network/data_source/model/posts/network/network_post_details.dart';
import 'package:appost/base/network/data_source/model/posts/network/network_post_response.dart';
import 'package:appost/base/network/data_source/model/posts/network/new_post_model.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/network/data_source/service/posts/posts_service.dart';
import 'package:appost/base/network/repository/base_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@RegisterAs(PostsRepository)
class PostRepositoryImpl extends BaseRepository implements PostsRepository {
  final PostsService _service;

  PostRepositoryImpl(this._service);

  @override
  Future<NetworkPostResponse> getPosts({@required int page, String userNick}) =>
      call(() => _service.getPosts(page, userNick));

  @override
  Future<NetworkPostDetails> getPostDetails({@required int postId}) => call(() => _service.getPostDetails(postId));

  @override
  Future<void> addNewPost({@required NewPostModel model}) => call(() => _service.addNewPost(model));
}
