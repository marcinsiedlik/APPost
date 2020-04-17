import 'package:flutter/material.dart';

class PagedCallState<T> {
  PagedStatus status;
  T data;
  Exception exception;

  PagedCallState() : status = PagedStatus.INITIAL;

  PagedCallState.initial() : status = PagedStatus.INITIAL;

  PagedCallState.initialProgress() : status = PagedStatus.INITIAL_PROGRESS;

  PagedCallState.initialSuccess(this.data) : status = PagedStatus.INITIAL_SUCCESS;

  PagedCallState.initialError(this.exception) : status = PagedStatus.INITIAL_ERROR;

  PagedCallState.additionalProgress() : status = PagedStatus.ADDITIONAL_PROGRESS;

  PagedCallState.additionalSuccess(this.data) : status = PagedStatus.ADDITIONAL_SUCCESS;

  PagedCallState.additionalError(this.exception) : status = PagedStatus.ADDITIONAL_ERROR;

  @override
  String toString() => "Status : $status \n Message : $exception \n Data : $data";

  // ignore: missing_return
  R whenInitial<R>({
    @required R initial(),
    @required R progress(),
    @required R success(T data),
    @required R error(Exception exception),
  }) {
    switch (this.status) {
      case PagedStatus.INITIAL:
        return initial();
      case PagedStatus.INITIAL_PROGRESS:
        return progress();
      case PagedStatus.INITIAL_SUCCESS:
        return success(data);
      case PagedStatus.INITIAL_ERROR:
        return error(exception);
      default:
        return success(data);
    }
  }

  // ignore: missing_return
  R whenAdditional<R>({
    @required R progress(),
    R success(T data),
    @required R error(Exception exception),
  }) {
    switch (this.status) {
      case PagedStatus.ADDITIONAL_PROGRESS:
        return progress();
      case PagedStatus.ADDITIONAL_SUCCESS:
        return success?.call(data);
      case PagedStatus.ADDITIONAL_ERROR:
        return error(exception);
      default:
        return null;
    }
  }
}

enum PagedStatus {
  INITIAL,
  INITIAL_PROGRESS,
  INITIAL_SUCCESS,
  INITIAL_ERROR,
  ADDITIONAL_PROGRESS,
  ADDITIONAL_SUCCESS,
  ADDITIONAL_ERROR,
}
