import 'package:appost/base/network/data_source/model/posts/network/network_post.dart';
import 'package:appost/base/ui/pagination/model/pageable.dart';
import 'package:appost/base/ui/pagination/model/paged_sort.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_post_response.freezed.dart';

part 'network_post_response.g.dart';

@freezed
abstract class NetworkPostResponse with _$NetworkPostResponse {
  const factory NetworkPostResponse({
    @required List<NetworkPost> content,
    @required Pageable pageable,
    @required int totalPages,
    @required int totalElements,
    @required bool last,
    @required int size,
    @required bool first,
    @required int numberOfElements,
    @required int number,
    @required PagedSort sort,
    @required bool empty,
  }) = _NetworkPostResponse;

  factory NetworkPostResponse.fromJson(Map<String, dynamic> json) => _$NetworkPostResponseFromJson(json);
}
