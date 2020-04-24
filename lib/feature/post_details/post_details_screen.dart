import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/extensions/notifier_extensions.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_details.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:appost/base/ui/widgets/error_view.dart';
import 'package:appost/feature/post_details/post_details_notifier.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;

  PostDetailsScreen(this.postId);

  static const _datePattern = [H, ':', nn, ' | ', dd, '.', m, '.', yyyy];

  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer<PostDetailsNotifier>(
      create: (_) => getIt<PostDetailsNotifier>(param1: postId),
      builder: (context, notifier, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.colorPrimary),
        ),
        body: SafeArea(
          child: notifier.postDetailsState.when(
            initial: () => Container(),
            progress: () => Center(child: CircularProgressIndicator()),
            success: (details) => _buildPostDetails(context, notifier, details),
            error: (_) => ErrorView(messageKey: 'post_details_fetch_error'),
          ),
        ),
      ),
    );
  }

  Widget _buildPostDetails(BuildContext context, PostDetailsNotifier notifier, UiPostDetails details) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 8),
        _buildUserInfoSection(context, notifier, details),
        const SizedBox(height: 32),
        _buildContentSection(context, notifier, details),
        const SizedBox(width: 32),
      ],
    );
  }

  Widget _buildUserInfoSection(BuildContext context, PostDetailsNotifier notifier, UiPostDetails details) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16),
        SvgPicture.asset('assets/icons/account_circle.svg', width: 56),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              details.userName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.colorPrimary,
                fontSize: 18,
              ),
            ),
            Text(
              '@${details.userNick}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Spacer(),
        RaisedButton(
          color: AppColors.colorAccent,
          textColor: Colors.white,
          child: Text('Zobacz profil'),
          onPressed: notifier.onVisitProfileClicked,
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context, PostDetailsNotifier notifier, UiPostDetails details) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            details.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimary,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 0),
          Text(
            '${AppLocalizations.of(context).get('published')}: ${formatDate(details.creationDate, _datePattern)}',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black38,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            details.content,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
