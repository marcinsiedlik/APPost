import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_sort.freezed.dart';

part 'paged_sort.g.dart';

@freezed
abstract class PagedSort with _$PagedSort {
  const factory PagedSort({
    @required bool sorted,
    @required bool unsorted,
    @required bool empty,
  }) = _PagedSort;

  factory PagedSort.fromJson(Map<String, dynamic> json) => _$PagedSortFromJson(json);
}
