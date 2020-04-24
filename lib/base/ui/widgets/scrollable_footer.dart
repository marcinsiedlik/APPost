import 'package:flutter/material.dart';

class ScrollableFooter extends StatelessWidget {
  final List<Widget> _widgets;
  final List<Widget> body;
  final Widget footer;

  ScrollableFooter({
    @required this.body,
    @required this.footer,
  }) : this._widgets = body
          ..add(
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: footer,
              ),
            ),
          );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            minHeight: constraints.maxHeight,
            maxHeight: double.infinity,
          ),
          child: IntrinsicHeight(
            child: Column(children: _widgets),
          ),
        ),
      ),
    );
  }
}
