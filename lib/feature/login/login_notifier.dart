import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/forms/form_field_controller.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginNotifier extends BaseNotifier {
  final UserRepository _userRepository;
  final OauthTokensStorage _tokensStorage;

  LoginNotifier(this._userRepository, this._tokensStorage);

  final formKey = GlobalKey<FormState>();

  final emailField = FormFieldController();
  final passwordField = FormFieldController();

  var loginState = CallState<TokensResponse>();

  void _fetchLogin() async {
    dispatch<TokensResponse>(
      callState: loginState,
      block: () => _userRepository.login(
        email: emailField.text,
        password: passwordField.text,
      ),
      onSuccess: _onLoginSuccess,
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void _onLoginSuccess(TokensResponse response) {
    _tokensStorage.saveTokens(response.accessToken, response.refreshToken);
    ExtendedNavigator.ofRouter<Router>().pushNamedAndRemoveUntil(Routes.postsScreen, (route) => false);
  }

  void onLoginClicked() {
    if (formKey.currentState.validate()) {
      _fetchLogin();
    }
  }

  void onRegisterClicked() {
    ExtendedNavigator.ofRouter<Router>().pushRegisterScreen();
  }

  @override
  void dispose() {
    emailField.dispose();
    passwordField.dispose();
    super.dispose();
  }
}
