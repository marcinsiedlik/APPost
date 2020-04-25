import 'dart:io' show Platform;

import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AppDialogsMixin {
  Future<bool> showYesNoDialog({
    @required BuildContext context,
    String titleKey = 'attention',
    @required String messageKey,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog<bool>(
        context: context,
        builder: (context) => _buildCupertinoYesNoDialog(
          context: context,
          titleKey: titleKey,
          messageKey: messageKey,
        ),
      );
    } else {
      return showDialog<bool>(
        context: context,
        builder: (context) => _buildMaterialYesNoDialog(
          context: context,
          titleKey: titleKey,
          messageKey: messageKey,
        ),
        barrierDismissible: false,
      );
    }
  }

  Widget _buildMaterialYesNoDialog({
    BuildContext context,
    String titleKey,
    String messageKey,
  }) {
    final localizations = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(
        localizations.get(titleKey),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.colorPrimary,
        ),
      ),
      content: Text(
        localizations.get(messageKey),
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            localizations.get('no'),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimary,
            ),
          ),
          onPressed: () => ExtendedNavigator.ofRouter<Router>().pop(false),
        ),
        FlatButton(
          child: Text(
            localizations.get('yes'),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimary,
            ),
          ),
          onPressed: () => ExtendedNavigator.ofRouter<Router>().pop(true),
        ),
      ],
    );
  }

  Widget _buildCupertinoYesNoDialog({
    BuildContext context,
    String titleKey,
    String messageKey,
  }) {
    final localizations = AppLocalizations.of(context);
    return CupertinoAlertDialog(
      title: Text(localizations.get(titleKey)),
      content: Text(localizations.get(messageKey)),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(localizations.get('no')),
          onPressed: () => ExtendedNavigator.ofRouter<Router>().pop(false),
        ),
        CupertinoDialogAction(
          child: Text(localizations.get('yes')),
          onPressed: () => ExtendedNavigator.ofRouter<Router>().pop(true),
        ),
      ],
    );
  }
}
