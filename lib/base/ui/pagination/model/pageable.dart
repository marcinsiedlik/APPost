import 'package:appost/base/ui/pagination/model/paged_sort.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable.freezed.dart';

part 'pageable.g.dart';

@freezed
abstract class Pageable with _$Pageable {
  const factory Pageable({
    @required PagedSort sort,
    @required int offset,
    @required int pageSize,
    @required int pageNumber,
    @required bool paged,
    @required @JsonKey(name: 'unpaged') bool unPaged,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);
}
