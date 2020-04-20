import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/network/exceptions/api_exception.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/call_state/paged_call_state.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:appost/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseNotifier with ChangeNotifier {
//  void dispatch<T, U>({
//    CallState<T> callState,
//    PagedCallState<T> pagedCallState,
//    @required Future<U> call(),
//    @required T transform(U response),
//    onSuccess(T result),
//    onError(Exception e),
//    bool additionalFetch = false,
//  }) async {
//    assert((callState == null) != (pagedCallState == null));
//    if (callState != null) {
//      _updateStatusAndNotify(callState, Status.PROGRESS);
//    } else {
//      _updatePagedStatusAndNotify(
//        pagedCallState,
//        additionalFetch ? PagedStatus.ADDITIONAL_PROGRESS : PagedStatus.INITIAL_PROGRESS,
//      );
//    }
//    try {
//      final response = await call();
//      final transformed = transform(response);
//      onSuccess?.call(transformed);
//      if (callState != null) {
//        callState.data = transformed;
//        _updateStatusAndNotify(callState, Status.SUCCESS);
//      } else {
//        pagedCallState.data = transformed;
//        _updatePagedStatusAndNotify(
//          pagedCallState,
//          additionalFetch ? PagedStatus.ADDITIONAL_SUCCESS : PagedStatus.INITIAL_SUCCESS,
//        );
//      }
//    } on Error catch (e, st) {
//      logger.e('Dispatch error: ', e, st);
//    } catch (e, st) {
//      logger.e('Dispatch exception: ', e.runtimeType, st);
//      onError?.call(e);
//      if (callState != null) {
//        callState.exception = e;
//        _updateStatusAndNotify(callState, Status.ERROR);
//      } else {
//        pagedCallState.exception = e;
//        _updatePagedStatusAndNotify(
//          pagedCallState,
//          additionalFetch ? PagedStatus.ADDITIONAL_ERROR : PagedStatus.INITIAL_ERROR,
//        );
//      }
//    }
//  }

  void dispatch<T>({
    CallState<T> callState,
    PagedCallState<T> pagedCallState,
    @required Future<T> block(),
    onSuccess(T result),
    onError(Exception e),
    bool additionalFetch = false,
  }) async {
    assert((callState == null) != (pagedCallState == null));
    if (callState != null) {
      _updateStatusAndNotify(callState, Status.PROGRESS);
    } else {
      _updatePagedStatusAndNotify(
        pagedCallState,
        additionalFetch ? PagedStatus.ADDITIONAL_PROGRESS : PagedStatus.INITIAL_PROGRESS,
      );
    }
    try {
      final response = await block();
      onSuccess?.call(response);
      if (callState != null) {
        callState.data = response;
        _updateStatusAndNotify(callState, Status.SUCCESS);
      } else {
        pagedCallState.data = response;
        _updatePagedStatusAndNotify(
          pagedCallState,
          additionalFetch ? PagedStatus.ADDITIONAL_SUCCESS : PagedStatus.INITIAL_SUCCESS,
        );
      }
    } on Error catch (e, st) {
      logger.e('Dispatch error: ', e, st);
    } catch (e, st) {
      if (e is UnauthorizedException) {
        _clearTokensAndNavigateToLoginScreen();
        return;
      }
      logger.e('Dispatch exception: ', e.runtimeType, st);
      onError?.call(e);
      if (callState != null) {
        callState.exception = e;
        _updateStatusAndNotify(callState, Status.ERROR);
      } else {
        pagedCallState.exception = e;
        _updatePagedStatusAndNotify(
          pagedCallState,
          additionalFetch ? PagedStatus.ADDITIONAL_ERROR : PagedStatus.INITIAL_ERROR,
        );
      }
    }
  }

  void _updateStatusAndNotify(CallState callState, Status status) {
    callState.status = status;
    notifyListeners();
  }

  void _updatePagedStatusAndNotify(PagedCallState callState, PagedStatus status) {
    callState.status = status;
    notifyListeners();
  }

  void _clearTokensAndNavigateToLoginScreen() {
    getIt<OauthTokensStorage>().clearTokens();
    ExtendedNavigator.ofRouter<Router>().pushNamedAndRemoveUntil(Routes.loginScreen, (_) => false);
  }
}
