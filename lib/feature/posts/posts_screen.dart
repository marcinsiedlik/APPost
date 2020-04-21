import 'package:appost/base/di/get_it.dart';
import 'package:appost/base/extensions/notifier_extensions.dart';
import 'package:appost/base/network/data_source/model/user/ui/ui_user.dart';
import 'package:appost/base/ui/widgets/error_view.dart';
import 'package:appost/feature/posts/posts_notifier.dart';
import 'package:appost/feature/posts/widget/post_item.dart';
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
          notifier.postsCallState.whenInitialOrElse(
            success: (_) => _buildPostsList(context, notifier),
            error: (_) => SliverFillRemaining(
              child: ErrorView(messageKey: 'posts_fetch_error'),
            ),
            orElse: () => SliverFillRemaining(),
          ),
        ],
      ),
      onRefresh: notifier.onRefreshed,
    );
  }

  Widget _buildPostsList(BuildContext context, PostsNotifier notifier) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => PostItem(
          item: notifier.posts[index],
          onClicked: notifier.onPostClicked,
        ),
        childCount: notifier.posts.length,
      ),
    );
  }
}
