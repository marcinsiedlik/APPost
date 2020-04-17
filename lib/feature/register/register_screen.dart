import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/feature/register/register_form.dart';
import 'package:appost/feature/register/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => getIt<RegisterNotifier>(),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              _buildRegisterHeader(context),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/icons/account_plus.svg',
            width: 56,
            color: AppColors.colorPrimary,
          ),
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context).get('register'),
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
}
