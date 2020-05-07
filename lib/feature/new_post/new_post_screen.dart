import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/widgets/big_button.dart';
import 'package:appost/feature/new_post/new_post_form.dart';
import 'package:appost/feature/new_post/new_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<NewPostNotifier>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          centerTitle: false,
          title: Text(
            AppLocalizations.of(context).get('new_post'),
            style: const TextStyle(
              color: AppColors.colorPrimary,
            ),
          ),
          iconTheme: IconThemeData(color: AppColors.colorPrimary),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  NewPostForm(),
                  Container(
                    height: 100,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<NewPostNotifier>(
                  builder: (context, notifier, _) => Container(
                    color: Colors.white,
                    child: BigButton(
                      labelKey: 'save',
                      onPressed: notifier.onSendButtonClicked,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
