import 'package:appost/feature/posts/model/app_bar_menu_action.dart';
import 'package:flutter/foundation.dart';

class AppBarMenuItem {
  final AppBarMenuAction action;
  final String iconPath;
  final String labelKey;

  AppBarMenuItem({
    @required this.action,
    @required this.iconPath,
    @required this.labelKey,
  });

  static final defaultItems = [
    AppBarMenuItem(
      action: AppBarMenuAction.logout(),
      iconPath: 'assets/icons/logout.svg',
      labelKey: 'logout',
    ),
    AppBarMenuItem(
      action: AppBarMenuAction.removeAccount(),
      iconPath: 'assets/icons/account_remove.svg',
      labelKey: 'remove_account',
    ),
  ];
}
