import 'package:appost/base/ui/routes/routes.dart';
import 'package:appost/feature/login/login_screen.dart';
import 'package:appost/feature/register/register_screen.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter()
class $MaterialRouter implements $Routes {
  @override
  @initial
  LoginScreen loginScreen;

  @override
  RegisterScreen registerScreen;
}
