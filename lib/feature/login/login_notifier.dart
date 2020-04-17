import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginNotifier extends BaseNotifier {
  final formKey = GlobalKey<FormState>();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
