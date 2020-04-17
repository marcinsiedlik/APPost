import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_details.freezed.dart';

part 'post_details.g.dart';

@freezed
abstract class PostDetails with _$PostDetails {
  const factory PostDetails({
    @required int id,
    @required int userId,
    @required String userNick,
    @required int creationDate,
    @required String title,
    @required String description,
  }) = _PostDetails;

  factory PostDetails.fromJson(Map<String, dynamic> json) => _$PostDetailsFromJson(json);
}
