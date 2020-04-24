import 'package:appost/base/ui/forms/form_validations_mixin.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/feature/new_post/new_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostForm extends StatelessWidget with AppFormsMixin {
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NewPostNotifier>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: notifier.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildTitleField(context, notifier),
            const SizedBox(height: 16),
            _buildContentField(context, notifier),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField(BuildContext context, NewPostNotifier notifier) {
    return buildFormField(
      controller: notifier.titleField.textController,
      node: notifier.titleField.focusNode,
      validator: (field) => validateIsEmpty(context, field),
      onEditingComplete: () => FocusScope.of(context).requestFocus(notifier.contentField.focusNode),
      labelText: AppLocalizations.of(context).get('title'),
      maxLength: 50,
      maxLines: null,
    );
  }

  Widget _buildContentField(BuildContext context, NewPostNotifier notifier) {
    return buildFormField(
      controller: notifier.contentField.textController,
      node: notifier.contentField.focusNode,
      validator: (field) => validateIsEmpty(context, field),
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        notifier.onSendButtonClicked();
      },
      labelText: AppLocalizations.of(context).get('content'),
      maxLength: 1000,
      maxLines: null,
    );
  }
}
