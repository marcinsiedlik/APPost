import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/model/user/register_model.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/forms/form_field_controller.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterNotifier extends BaseNotifier {
  final UserRepository _userRepository;

  RegisterNotifier(this._userRepository);

  final formKey = GlobalKey<FormState>();

  final emailField = FormFieldController();
  final nickField = FormFieldController();
  final passwordField = FormFieldController();
  final repeatedPasswordField = FormFieldController();
  final firstNameField = FormFieldController();
  final lastNameField = FormFieldController();
  final placeField = FormFieldController();

  var registerState = CallState<void>();

  void _registerFetch() async {
    dispatch(
      callState: registerState,
      block: () => _userRepository.register(_createRegisterModel()),
      onSuccess: (data) => ExtendedNavigator.rootNavigator.pop(),
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onRegisterClicked() {
    if (formKey.currentState.validate()) {
      _registerFetch();
    }
  }

  RegisterModel _createRegisterModel() => RegisterModel(
        email: emailField.text,
        nick: nickField.text,
        password: passwordField.text,
        repeatedPassword: repeatedPasswordField.text,
        firstName: firstNameField.text,
        lastName: lastNameField.text,
        place: placeField.text,
      );

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
}
