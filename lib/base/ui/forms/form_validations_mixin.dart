import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';

mixin FormValidationsMixin {
  validateEmail(BuildContext context, String field) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    if (!EmailValidator.validate(field)) {
      return localizations.get('validation_invalid_email');
    }
    return null;
  }

  validatePassword(BuildContext context, String field) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    if (field.length < 6) {
      return localizations.get('password_to_short');
    }
    return null;
  }
}
