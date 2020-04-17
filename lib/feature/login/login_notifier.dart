import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/repository/user/user_repository.dart';
import 'package:appost/base/network/tokens/model/tokens_response.dart';
import 'package:appost/base/network/tokens/storage/oauth_tokens_storage.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginNotifier extends BaseNotifier {
  final UserRepository _userRepository;
  final OauthTokensStorage _tokensStorage;

  LoginNotifier(this._userRepository, this._tokensStorage);

  final formKey = GlobalKey<FormState>();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var loginState = CallState<TokensResponse>();

  void _fetchLogin() async {
    dispatch<TokensResponse>(
      callState: loginState,
      block: () => _userRepository.login(
        email: emailController.text,
        password: passwordController.text,
      ),
      onSuccess: (data) => _tokensStorage.saveTokens(data.accessToken, data.refreshToken),
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onLoginClicked() {
    if (formKey.currentState.validate()) {
      _fetchLogin();
    }
  }

  void onRegisterClicked() {
    loginState = CallState.progress();
    notifyListeners();
    Future.delayed(Duration(seconds: 3), () {
      loginState = CallState();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
