import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/extensions/notifier_extensions.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/feature/posts/posts_notifier.dart';
import 'package:appost/feature/posts/widget/posts_app_bar.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer(
      create: (_) => getIt<PostsNotifier>(),
      builder: _buildPageLayout,
    );
  }

  Widget _buildPageLayout(BuildContext context, PostsNotifier notifier, Widget _) {
    return Scaffold(
      body: SafeArea(
        child: notifier.userCallState.when(
          initial: () => Container(),
          progress: () => Center(child: CircularProgressIndicator()),
          success: (user) => _buildScrollView(context, notifier, user),
          error: (_) => Container(),
        ),
      ),
    );
  }

  Widget _buildScrollView(BuildContext context, PostsNotifier notifier, UiUser user) {
    return RefreshIndicator(
      displacement: 120,
      child: CustomScrollView(
        controller: notifier.pagedScrollController,
        slivers: <Widget>[
          PostsAppBar(
            userTitle: user.firstName,
            onSearchChanged: notifier.onSearchChanged,
            onAvatarClicked: notifier.onAvatarClicked,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  color: Colors.blueGrey,
                  height: 100,
                ),
              ),
              childCount: 20,
            ),
          )
        ],
      ),
      onRefresh: notifier.onRefreshed,
    );
  }
}
