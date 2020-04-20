import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostsAppBar extends StatefulWidget {
  final String userTitle;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onAvatarClicked;

  PostsAppBar({
    @required this.userTitle,
    @required this.onSearchChanged,
    @required this.onAvatarClicked,
  });

  @override
  _PostsAppBarState createState() => _PostsAppBarState();
}

class _PostsAppBarState extends State<PostsAppBar> {
  TextEditingController controller;
  bool isFieldEmpty = true;

  @override
  void initState() {
    controller = TextEditingController()..addListener(_onTextChanged);
    super.initState();
  }

  void _onTextChanged() {
    if (controller.text.isEmpty != isFieldEmpty) {
      setState(() {
        isFieldEmpty = controller.text.isEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        '${AppLocalizations.of(context).get('welcome')} ${widget.userTitle}',
        style: const TextStyle(
          color: AppColors.colorPrimary,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/account_circle.svg', width: 36, height: 36),
          onPressed: widget.onAvatarClicked,
        ),
      ],
      expandedHeight: 2 * kToolbarHeight,
      flexibleSpace: _buildSearchField(context),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.colorPrimary,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).get('search_nick'),
              prefixIcon: Icon(Icons.search),
              suffixIcon: isFieldEmpty
                  ? Container(width: 24, height: 24)
                  : GestureDetector(
                      onTap: () => _onClearButtonTap(context),
                      child: Icon(Icons.clear),
                    ),
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          height: kToolbarHeight,
          color: Colors.white,
        )
      ],
    );
  }

  void _onClearButtonTap(BuildContext context) {
    controller.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void dispose() {
    controller
      ..removeListener(_onTextChanged)
      ..dispose();
    super.dispose();
  }
}
