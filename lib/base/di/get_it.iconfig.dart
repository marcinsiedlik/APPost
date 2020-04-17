// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:appost/base/di/network_module.dart';
import 'package:appost/base/di/util_module.dart';
import 'package:appost/base/network/data_source/repository/register_repo.dart';
import 'package:appost/base/network/data_source/service/rest_service.dart';
import 'package:appost/base/network/tokens/repository/refresh_token_repository.dart';
import 'package:appost/base/network/tokens/repository/refresh_token_repository_impl.dart';
import 'package:appost/base/network/tokens/service/refresh_token_service.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:appost/feature/login/login_notifier.dart';
import 'package:auto_route/src/extended_navigator.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final networkModule = _$NetworkModule();
  final utilModule = _$UtilModule();
  g.registerLazySingleton<Dio>(() => networkModule.dio);
  g.registerLazySingleton<Dio>(() => networkModule.tokenDio, instanceName: 'tokenClient');
  g.registerLazySingleton<ExtendedNavigator<RouterBase>>(() => utilModule.navigatorBuilder);
  g.registerFactory<LoginNotifier>(() => LoginNotifier());
  g.registerLazySingleton<RefreshTokenService>(() => RefreshTokenService(g<Dio>(instanceName: 'tokenClient')));
  g.registerLazySingleton<RegisterRepo>(() => RegisterRepo());
  g.registerLazySingleton<RestService>(() => RestService(g<Dio>()));
  g.registerLazySingleton<OauthTokensStorage>(() => OauthTokensStorage(g<SharedPreferences>()));
  g.registerLazySingleton<RefreshTokenRepository>(() => RefreshTokenRepositoryImpl(g<RefreshTokenService>()));

  //Eager singletons must be registered in the right order
  final sharedPreferences = await utilModule.preferences;
  g.registerSingleton<SharedPreferences>(sharedPreferences);
}

class _$NetworkModule extends NetworkModule {}

class _$UtilModule extends UtilModule {}
