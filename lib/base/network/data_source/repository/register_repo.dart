import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/network/data_source/model/post/post_details.dart';
import 'package:appost/base/network/data_source/model/register_dto.dart';
import 'package:appost/base/network/data_source/model/user_dto.dart';
import 'package:appost/base/network/data_source/service/rest_service.dart';
import 'package:appost/base/network/headers/network_headers.dart';
import 'package:appost/base/network/repository/base_repository.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterRepo extends BaseRepository {
  Future<UserDto> register(RegisterDto dto) => call(() => getIt<RestService>().register(dto));

  Future<TokensResponse> login({
    @required String email,
    @required String password,
    String grantType = passwordGrantType,
  }) =>
      call(() => getIt<RestService>().login(email, password, grantType));

  Future<PostDetails> getPostDetails() => call(() => getIt<RestService>().getPostDetails());
}
