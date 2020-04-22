import 'package:appost/feature/login/login_screen.dart';
import 'package:appost/feature/post_details/post_details_screen.dart';
import 'package:appost/feature/posts/posts_screen.dart';
import 'package:appost/feature/register/register_screen.dart';
import 'package:appost/feature/user_profile/user_profile_screen.dart';
import 'package:auto_route/auto_route_annotations.dart';

@CupertinoAutoRouter(
  generateNavigationHelperExtension: true,
  generateArgsHolderForSingleParameterRoutes: false,
)
abstract class $Router {
  LoginScreen loginScreen;
  RegisterScreen registerScreen;
  @initial
  PostsScreen postsScreen;
  PostDetailsScreen postDetailsScreen;
  UserProfileScreen userProfileScreen;
}
