import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final UiPost item;
  final ValueChanged<UiPost> onClicked;

  PostItem({
    @required this.item,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
