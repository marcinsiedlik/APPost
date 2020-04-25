import 'package:appost/base/network/data_source/model/user/network/network_user.dart';
import 'package:appost/base/network/data_source/model/user/network/register_model.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';

abstract class UserRepository {
  Future<TokensResponse> login({String email, String password});

  Future<void> register({RegisterModel model});

  Future<NetworkUser> getLoggedUserInfo();

  Future<NetworkUser> getUserInfo({int userId});

  Future<void> deleteAccount();
}
