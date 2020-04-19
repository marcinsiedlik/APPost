import 'package:appost/base/network/data_source/model/posts/network/network_post_details.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_details.dart';
import 'package:appost/base/network/mapper/ui_mapper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostDetailsUiMapper implements UiMapper<NetworkPostDetails, UiPostDetails> {
  @override
  UiPostDetails mapToUi(NetworkPostDetails network) => UiPostDetails(
        id: network.id,
        userId: network.userId,
        userNick: network.userNick,
        creationDate: DateTime.tryParse(network.creationDate),
        title: network.title,
        description: network.description,
      );
}
