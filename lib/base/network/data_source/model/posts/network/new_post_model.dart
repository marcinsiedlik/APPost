import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_post_model.freezed.dart';

part 'new_post_model.g.dart';

@freezed
abstract class NewPostModel with _$NewPostModel {
  const factory NewPostModel({
    @required String title,
    @required String content,
  }) = _NewPostModel;

  factory NewPostModel.fromJson(Map<String, dynamic> json) => _$NewPostModelFromJson(json);
}
