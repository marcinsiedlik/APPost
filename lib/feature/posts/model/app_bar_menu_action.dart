import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_menu_action.freezed.dart';

@freezed
abstract class AppBarMenuAction with _$AppBarMenuAction {
  const factory AppBarMenuAction.logout() = Logout;

  const factory AppBarMenuAction.removeAccount() = RemoveAccount;
}
