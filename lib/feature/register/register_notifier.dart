import 'package:appost/base/ui/forms/form_field_controller.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterNotifier extends BaseNotifier {
  final formKey = GlobalKey<FormState>();

  final emailField = FormFieldController();
  final nickField = FormFieldController();
  final passwordField = FormFieldController();
  final repeatedPasswordField = FormFieldController();
  final firstNameField = FormFieldController();
  final lastNameField = FormFieldController();
  final placeField = FormFieldController();

  @override
  void dispose() {
    emailField.dispose();
    nickField.dispose();
    passwordField.dispose();
    repeatedPasswordField.dispose();
    firstNameField.dispose();
    lastNameField.dispose();
    placeField.dispose();
    super.dispose();
  }

  void onRegisterClicked() {}
}
