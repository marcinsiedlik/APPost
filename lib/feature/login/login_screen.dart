import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/widgets/big_button.dart';
import 'package:appost/feature/login/login_form.dart';
import 'package:appost/feature/login/login_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => getIt<LoginNotifier>(),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              _buildLoginHeader(context),
              LoginForm(),
              _buildButtonsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/icons/account_circle.svg',
            width: 56,
            color: AppColors.colorPrimary,
          ),
          const SizedBox(width: 16),
          Text(
            AppLocalizations.of(context).get('login'),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: AppColors.colorPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, notifier, _) => Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            notifier.loginState.whenOrElse(
              progress: () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: CircularProgressIndicator(),
              ),
              orElse: () => BigButton(
                labelKey: 'sign_in',
                onPressed: notifier.onLoginClicked,
              ),
            ),
            BigButton(
              color: AppColors.colorAccent,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              labelKey: 'register_invite',
              onPressed: notifier.onRegisterClicked,
            ),
          ],
        ),
      ),
    );
  }
}
