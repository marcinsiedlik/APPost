import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_post.freezed.dart';
part 'ui_post.g.dart';

@freezed
abstract class UiPost with _$UiPost {
  const factory UiPost({
    @required int id,
    @required String userNick,
    @required DateTime creationDate,
    @required String description,
  }) = _UiPost;

  factory UiPost.fromJson(Map<String, dynamic> json) => _$UiPostFromJson(json);
}
