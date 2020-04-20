import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class OauthTokensStorage {
  static const String _accessTokenKey = 'ACCESS_TOKEN_KEY';
  static const String _refreshTokenKey = 'REFRESH_TOKEN_KEY';

  final SharedPreferences _prefs;

  OauthTokensStorage(this._prefs);

  String get accessToken => _prefs.getString(_accessTokenKey);

  String get refreshToken => _prefs.getString(_refreshTokenKey);

  bool get areTokensPresent => accessToken != null && refreshToken != null;

  void saveTokens(String accessToken, String refreshToken) async {
    _prefs.setString(_accessTokenKey, accessToken);
    _prefs.setString(_refreshTokenKey, refreshToken);
  }

  void clearTokens() async {
    _prefs.setString(_accessTokenKey, null);
    _prefs.setString(_refreshTokenKey, null);
  }
}
