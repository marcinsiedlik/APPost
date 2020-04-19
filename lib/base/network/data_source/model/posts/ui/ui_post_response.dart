import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_post_response.freezed.dart';

part 'ui_post_response.g.dart';

@freezed
abstract class UiPostResponse with _$UiPostResponse {
  const factory UiPostResponse({
    @required List<UiPost> posts,
    @required int page,
    @required int pageSize,
    @required int totalPages,
    @required int totalElements,
    @required bool first,
    @required bool last,
  }) = _UiPostResponse;

  factory UiPostResponse.fromJson(Map<String, dynamic> json) => _$UiPostResponseFromJson(json);
}
