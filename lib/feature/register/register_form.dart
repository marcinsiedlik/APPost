import 'package:appost/base/ui/forms/form_validations_mixin.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/feature/register/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget with AppFormsMixin {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<RegisterNotifier>(context);
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
            _buildNickField(context, notifier),
            const SizedBox(height: 16),
            _buildPasswordField(context, notifier),
            const SizedBox(height: 16),
            _buildRepeatPasswordField(context, notifier),
            const SizedBox(height: 16),
            _buildFirstNameField(context, notifier),
            const SizedBox(height: 16),
            _buildLastNameField(context, notifier),
            const SizedBox(height: 16),
            _buildPlaceField(context, notifier),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.emailField.textController,
      node: notifier.emailField.focusNode,
      keyboardType: TextInputType.emailAddress,
      validator: (field) => validateEmail(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.nickField.focusNode),
      labelText: AppLocalizations.of(context).get('email_address'),
      prefixIcon: Icons.mail_outline,
    );
  }

  Widget _buildNickField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.nickField.textController,
      node: notifier.nickField.focusNode,
      validator: (field) => validateNick(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.passwordField.focusNode),
      labelText: AppLocalizations.of(context).get('nick'),
      prefixIcon: Icons.alternate_email,
    );
  }

  Widget _buildPasswordField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.passwordField.textController,
      node: notifier.passwordField.focusNode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (field) => validatePassword(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.repeatedPasswordField.focusNode),
      labelText: AppLocalizations.of(context).get('password'),
      prefixIcon: Icons.lock,
    );
  }

  Widget _buildRepeatPasswordField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.repeatedPasswordField.textController,
      node: notifier.repeatedPasswordField.focusNode,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (field) => validateRepeatPassword(context, field, notifier.passwordField.text),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.firstNameField.focusNode),
      labelText: AppLocalizations.of(context).get('repeat_password'),
      prefixIcon: Icons.lock_outline,
    );
  }

  Widget _buildFirstNameField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.firstNameField.textController,
      node: notifier.firstNameField.focusNode,
      validator: (field) => validateIsEmpty(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.lastNameField.focusNode),
      labelText: AppLocalizations.of(context).get('first_name'),
      prefixIcon: Icons.person,
    );
  }

  Widget _buildLastNameField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.lastNameField.textController,
      node: notifier.lastNameField.focusNode,
      validator: (field) => validateIsEmpty(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.placeField.focusNode),
      labelText: AppLocalizations.of(context).get('last_name'),
      prefixIcon: Icons.person_outline,
    );
  }

  Widget _buildPlaceField(BuildContext context, RegisterNotifier notifier) {
    return buildFormField(
      controller: notifier.placeField.textController,
      node: notifier.placeField.focusNode,
      validator: (field) => validateIsEmpty(context, field),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        notifier.onRegisterClicked();
      },
      labelText: AppLocalizations.of(context).get('place'),
      prefixIcon: Icons.my_location,
    );
  }
}
