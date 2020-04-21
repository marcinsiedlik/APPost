import 'package:appost/base/network/data_source/model/posts/ui/ui_post.dart';
import 'package:appost/base/ui/app_ui_properties.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostItem extends StatelessWidget {
  final UiPost post;
  final ValueChanged<UiPost> onClicked;

  PostItem({
    @required this.post,
    @required this.onClicked,
  });

  static const _datePattern = ['godz. ', H, ':', nn, ' | ', dd, '.', m, '.', yyyy];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () => onClicked(post),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                _buildUserInfoSection(context),
                const SizedBox(height: 16),
                _buildContentSection(context),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoSection(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset('assets/icons/account_circle.svg', width: 42),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Marcin Siedlik',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.colorPrimary,
                fontSize: 15,
              ),
            ),
            Text(
              '@${post.userNick}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Text(
                  post.title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorPrimary,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                ),
              ),
              Spacer(),
              Text(
                formatDate(post.creationDate, _datePattern),
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black38,
                  fontSize: 12,
                ),
                maxLines: 3,
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            post.description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
