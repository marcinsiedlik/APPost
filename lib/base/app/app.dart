import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/localization/resolution_callbacks.dart' as resolutionCallbacks;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApPost',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      supportedLocales: [
        const Locale('pl'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: resolutionCallbacks.getSupportedListLocale,
      localeResolutionCallback: resolutionCallbacks.getSupportedLocale,
      builder: getIt<ExtendedNavigator>(),
    );
  }
}
