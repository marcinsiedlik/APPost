import 'package:appost/base/network/data_source/mapper/posts/post_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/posts/network/network_post_response.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_response.dart';
import 'package:appost/base/network/mapper/ui_mapper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostResponseUiMapper implements UiMapper<NetworkPostResponse, UiPostResponse> {
  final PostUiMapper _postUiMapper;

  PostResponseUiMapper(this._postUiMapper);

  @override
  UiPostResponse mapToUi(NetworkPostResponse network) => UiPostResponse(
        posts: network.content.map(_postUiMapper.mapToUi).toList(),
        page: network.number,
        pageSize: network.size,
        totalPages: network.totalPages,
        totalElements: network.totalElements,
        first: network.first,
        last: network.last,
      );
}
