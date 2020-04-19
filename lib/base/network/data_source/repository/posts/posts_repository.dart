import 'package:appost/base/network/data_source/model/posts/network/network_post_details.dart';
import 'package:appost/base/network/data_source/model/posts/network/network_post_response.dart';
import 'package:appost/base/network/data_source/model/posts/network/new_post_model.dart';

abstract class PostsRepository {
  Future<NetworkPostResponse> getPosts({int page, String userNick});

  Future<NetworkPostDetails> getPostDetails({int postId});

  Future<void> addNewPost({NewPostModel model});
}
