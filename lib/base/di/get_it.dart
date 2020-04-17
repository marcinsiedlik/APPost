import 'package:appost/base/di/get_it.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> initDependencyInjection() => $initGetIt(getIt);
