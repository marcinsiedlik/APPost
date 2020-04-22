import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/extensions/notifier_extensions.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/widgets/error_view.dart';
import 'package:appost/feature/user_profile/user_profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;

  UserProfileScreen(this.userId);

  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer<UserProfileNotifier>(
      create: (_) => getIt<UserProfileNotifier>(param1: userId),
      builder: (context, notifier, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.colorPrimary),
        ),
        body: SafeArea(
          child: notifier.userState.when(
            initial: () => Container(),
            progress: () => Center(child: CircularProgressIndicator()),
            success: (user) => _buildSuccessLayout(context, notifier, user),
            error: (_) => ErrorView(messageKey: 'user_fetch_error'),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessLayout(BuildContext context, UserProfileNotifier notifier, UiUser user) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 32),
        _buildUserHeader(context, user),
        const SizedBox(height: 32),
        _buildUserInfo(context, user),
      ],
    );
  }

  Widget _buildUserHeader(BuildContext context, UiUser user) {
    return Column(
      children: <Widget>[
        SvgPicture.asset('assets/icons/account_circle.svg', width: 100),
        const SizedBox(height: 16),
        Text(
          '${user.firstName} ${user.lastName}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: AppColors.colorPrimary,
          ),
        ),
        Text(
          '@${user.nick}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context, UiUser user) {
    final localizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            _buildInfoLine(
              title: localizations.get('email_address'),
              value: user.email,
            ),
            _buildInfoLine(
              title: localizations.get('place'),
              value: user.place,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoLine({
    @required String title,
    @required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: <Widget>[
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.colorAccent,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
