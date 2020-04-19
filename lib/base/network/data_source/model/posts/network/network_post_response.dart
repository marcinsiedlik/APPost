import 'package:appost/base/network/data_source/model/posts/network/network_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_post_response.freezed.dart';

part 'network_post_response.g.dart';

@freezed
abstract class NetworkPostResponse with _$NetworkPostResponse {
  const factory NetworkPostResponse({
    List<NetworkPost> content,
  }) = _NetworkPostResponse;

  factory NetworkPostResponse.fromJson(Map<String, dynamic> json) => _$NetworkPostResponseFromJson(json);
}
