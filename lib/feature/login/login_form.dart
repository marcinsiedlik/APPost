import 'package:appost/base/ui/forms/form_validations_mixin.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/feature/login/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget with AppFormsMixin {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<LoginNotifier>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: notifier.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildEmailField(context, notifier),
            const SizedBox(height: 16),
            _buildPasswordField(context, notifier),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context, LoginNotifier notifier) {
    return buildFormField(
      controller: notifier.emailField.textController,
      node: notifier.emailField.focusNode,
      keyboardType: TextInputType.emailAddress,
      validator: (field) => validateEmail(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.passwordField.focusNode),
      labelText: AppLocalizations.of(context).get('email_address'),
      prefixIcon: Icons.mail_outline,
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginNotifier notifier) {
    return buildFormField(
      controller: notifier.passwordField.textController,
      node: notifier.passwordField.focusNode,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.go,
      obscureText: true,
      validator: (field) => validatePassword(context, field),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        notifier.onLoginClicked();
      },
      labelText: AppLocalizations.of(context).get('password'),
      prefixIcon: Icons.lock_outline,
    );
  }
}
