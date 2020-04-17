import 'dart:io';

import 'package:appost/base/ui/routes/cupertiono_router.gr.dart';
import 'package:appost/base/ui/routes/material_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@registerModule
abstract class UtilModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get preferences async => await SharedPreferences.getInstance();

  @lazySingleton
  ExtendedNavigator get navigatorBuilder => Platform.isIOS
      ? ExtendedNavigator<CupertinoRouter>(router: CupertinoRouter())
      : ExtendedNavigator<MaterialRouter>(router: MaterialRouter());
}
