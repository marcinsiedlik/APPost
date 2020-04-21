import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_post_details.freezed.dart';
part 'ui_post_details.g.dart';

@freezed
abstract class UiPostDetails with _$UiPostDetails {
  const factory UiPostDetails({
    int id,
    int userId,
    String userNick,
    String userName,
    DateTime creationDate,
    String title,
    String content,
  }) = _UiPostDetails;

  factory UiPostDetails.fromJson(Map<String, dynamic> json) => _$UiPostDetailsFromJson(json);
}
