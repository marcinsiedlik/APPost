import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_post.freezed.dart';
part 'network_post.g.dart';

@freezed
abstract class NetworkPost with _$NetworkPost {
  const factory NetworkPost({
    @required int id,
    @required String userNick,
    @required int creationDate,
    @required String description,
  }) = _NetworkPost;

  factory NetworkPost.fromJson(Map<String, dynamic> json) => _$NetworkPostFromJson(json);
}
