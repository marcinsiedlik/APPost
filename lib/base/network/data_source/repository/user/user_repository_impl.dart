import 'package:appost/base/network/data_source/model/user/register_model.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/network/data_source/service/user/user_service.dart';
import 'package:appost/base/network/headers/network_headers.dart' as headers;
import 'package:appost/base/network/repository/base_repository.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@RegisterAs(UserRepository)
class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final UserService _service;

  UserRepositoryImpl(this._service);

  @override
  Future<TokensResponse> login({
    @required String email,
    @required String password,
  }) =>
      call(() => _service.login(email, password, headers.passwordGrantType));

  @override
  Future<void> register(RegisterModel model) => call(() => _service.register(model));
}
