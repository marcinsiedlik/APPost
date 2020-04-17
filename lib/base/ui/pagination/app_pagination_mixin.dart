import 'package:flutter/material.dart';

mixin AppPaginationMixin {
  final ScrollController pagedScrollController = ScrollController();

  var currentPage = 0;

  void Function(int) _onPageScrolled;

  void initPagination(void Function(int) onScroll) {
    _onPageScrolled = onScroll;
    pagedScrollController.addListener(_scrollControllerListener);
  }

  void onPagedRequestSuccess({@required first, @required last}) {
    if (first) {
      return;
    }
    if (last) {
      removePaginationListener();
      return;
    }
    addPaginationListener();
  }

  void resetCurrentPage() {
    currentPage = 0;
  }

  void addPaginationListener() {
    pagedScrollController.addListener(_scrollControllerListener);
  }

  void removePaginationListener() {
    pagedScrollController.removeListener(_scrollControllerListener);
  }

  void _scrollControllerListener() {
    if (pagedScrollController.offset >= pagedScrollController.position.maxScrollExtent - 200 &&
        !pagedScrollController.position.outOfRange) {
      removePaginationListener();
      _onPageScrolled(++currentPage);
    }
  }
}
