import 'package:appost/feature/login/login_screen.dart';
import 'package:appost/feature/posts/posts_screen.dart';
import 'package:appost/feature/register/register_screen.dart';
import 'package:auto_route/auto_route_annotations.dart';

@CupertinoAutoRouter(generateNavigationHelperExtension: true)
abstract class $Router {
  LoginScreen loginScreen;
  RegisterScreen registerScreen;
  PostsScreen postsScreen;
}
