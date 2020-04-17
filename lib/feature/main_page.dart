import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/network/data_source/repository/register_repo.dart';
import 'package:appost/base/network/exceptions/api_exception.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String userDto = '';

  @override
  void initState() {
    super.initState();
    getIt<RegisterRepo>()
        .getPostDetails()
//        .login(
//          email: 'stary@pijany.pl',
//          password: 'test123',
//        )
        .then((value) => setState(() {
              userDto = value.toString();
//              getIt<OauthTokensStorage>().saveTokens(value.accessToken, value.refreshToken);
            }))
        .catchError((e) => setState(() {
              if (e is ConnectivityException) {
                userDto = 'ConnectivityException';
              }
              userDto = e.toString();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(userDto),
      ),
    );
  }
}
