import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessDialogWidget extends StatelessWidget {
  final String text;
  SuccessDialogWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(
          dialogBackgroundColor: Provider.of<AppTheme>(context).background),
      child: AlertDialog(
//        title: Text(
//          'Change Dialog',
//          style: AppStyles.textStyleSettingItemHeader(context),
//        ),
        contentPadding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        content: Container(
          width: double
              .maxFinite, // fix intrinsic dimensions https://github.com/flutter/flutter/issues/18108
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.done_outline,
                  size: 50, color: Provider.of<AppTheme>(context).success),
              AutoSizeText(
                text,
                textAlign: TextAlign.center,
                style: AppStyles.textStyleDialogHeader(context),
                maxLines: 1,
                stepGranularity: 0.5,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('okey',
                style: AppStyles.textStyleParagraphPrimary(context)),
            onPressed: () async {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
