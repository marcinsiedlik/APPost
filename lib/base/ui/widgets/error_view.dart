import 'package:appost/base/ui/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ErrorType { error, emptyList }

class ErrorView extends StatelessWidget {
  final ErrorType type;
  final String titleKey;
  final String messageKey;

  ErrorView({
    this.type = ErrorType.error,
    this.titleKey,
    this.messageKey,
  });

  final _errorTypes = {
    ErrorType.error: _ErrorViewProperties('assets/images/error.svg', 'error_occurred'),
    ErrorType.emptyList: _ErrorViewProperties('assets/images/box.svg', 'nothing_is_here'),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          SvgPicture.asset(
            _errorTypes[type].iconAsset,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).get(titleKey != null ? titleKey : _errorTypes[type].titleKey),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          messageKey != null
              ? Text(
                  AppLocalizations.of(context).get(messageKey),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                )
              : Container(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ErrorViewProperties {
  final String iconAsset;
  final String titleKey;

  _ErrorViewProperties(this.iconAsset, this.titleKey);
}
