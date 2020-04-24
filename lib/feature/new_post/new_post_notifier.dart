import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/model/posts/network/new_post_model.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/forms/form_field_controller.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewPostNotifier extends BaseNotifier {
  final PostsRepository _repository;

  NewPostNotifier(this._repository);

  final formKey = GlobalKey<FormState>();
  final titleField = FormFieldController();
  final contentField = FormFieldController();

  final newPostState = CallState<void>();

  void _addNewPost() async {
    dispatch(
      callState: newPostState,
      block: () => _repository.addNewPost(
        model: NewPostModel(
          title: titleField.text,
          content: contentField.text,
        ),
      ),
      onSuccess: (_) {
        ExtendedNavigator.ofRouter<Router>().pop(true);
        RouterExtensions.showInfoFlushbar('created_successfully');
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onSendButtonClicked() {
    if (formKey.currentState.validate()) {
      _addNewPost();
    }
  }

  @override
  void dispose() {
    titleField.dispose();
    contentField.dispose();
    super.dispose();
  }
}
