import 'package:appost/base/di/get_it.dart';
import 'package:appost/feature/posts/posts_notifier.dart';
import 'package:appost/feature/posts/widget/posts_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<PostsNotifier>(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<PostsNotifier>(
            builder: (context, notifier, _) => CustomScrollView(
              slivers: <Widget>[
                PostsAppBar(
                  userTitle: 'Marcin',
                  onSearchChanged: (text) {},
                  onAvatarClicked: () {},
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 100,
                        color: Colors.blueGrey,
                      ),
                    ),
                    childCount: notifier.list.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
