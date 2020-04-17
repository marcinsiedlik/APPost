import 'package:appost/base/ui/widgets/error_flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_route.dart' as flushbarRoute;

extension RouterExtensions on ExtendedNavigatorState {
  static bool _isFlushbarVisible = false;

  static void showErrorFlushbar(Exception exception) async {
    if (_isFlushbarVisible) {
      return;
    }
    _isFlushbarVisible = true;
    ExtendedNavigator.rootNavigator.push(
      flushbarRoute.showFlushbar(
        context: ExtendedNavigator.rootNavigator.context,
        flushbar: ErrorFlushbar(
          context: ExtendedNavigator.rootNavigator.context,
          exception: exception,
          onDismiss: () => _isFlushbarVisible = false,
        ),
      ),
    );
  }
}
