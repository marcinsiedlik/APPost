import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/forms/form_validations_mixin.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/feature/login/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget with FormValidationsMixin {
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
    return TextFormField(
      controller: notifier.emailController,
      focusNode: notifier.emailNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.colorPrimary,
      validator: (field) => validateEmail(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.passwordNode),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12))),
        labelText: AppLocalizations.of(context).get('email_address'),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginNotifier notifier) {
    return TextFormField(
      controller: notifier.passwordController,
      focusNode: notifier.passwordNode,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      cursorColor: AppColors.colorPrimary,
      validator: (field) => validatePassword(context, field),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        notifier.onLoginClicked();
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12))),
        labelText: AppLocalizations.of(context).get('password'),
      ),
    );
  }
}
