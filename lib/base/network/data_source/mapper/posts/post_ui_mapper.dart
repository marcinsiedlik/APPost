import 'package:appost/base/network/data_source/model/posts/network/network_post.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:appost/base/network/mapper/ui_mapper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostUiMapper implements UiMapper<NetworkPost, UiPost> {
  @override
  UiPost mapToUi(NetworkPost network) => UiPost(
        id: network.id,
        userNick: network.userNick,
        userName: network.userName,
        creationDate: DateTime.tryParse(network.creationDate),
        title: network.title,
        description: network.description,
      );
}
