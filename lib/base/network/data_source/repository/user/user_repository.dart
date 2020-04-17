import 'package:appost/base/network/data_source/model/user/register_model.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:flutter/foundation.dart';

abstract class UserRepository {
  Future<TokensResponse> login({
    @required String email,
    @required String password,
  });

  Future<void> register(RegisterModel model);
}
