import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_post_details.freezed.dart';

part 'network_post_details.g.dart';

@freezed
abstract class NetworkPostDetails with _$NetworkPostDetails {
  const factory NetworkPostDetails({
    int id,
    int userId,
    String userNick,
    String creationDate,
    String title,
    String description,
  }) = _NetworkPostDetails;

  factory NetworkPostDetails.fromJson(Map<String, dynamic> json) => _$NetworkPostDetailsFromJson(json);
}
