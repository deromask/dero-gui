import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateDialog extends StatelessWidget {
  UpdateDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          dialogBackgroundColor: Provider.of<AppTheme>(context).background),
      child: Builder(
        builder: (context) {
          return AlertDialog(
            title: Text('Deromask Update',
                style: AppStyles.textStyleSettingItemHeader(context)),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
            content: Container(
              width: double.minPositive,
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    AutoSizeText(
                      "New version of DeroMask is available to download. Go to deromask.io to get your new Dero wallet.",
                      textAlign: TextAlign.left,
                      style: AppStyles.textStyleParagraph(context),
//                        maxLines: 1,
//                                  stepGranularity: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'Close',
                  style: AppStyles.textStyleParagraphPrimary(context),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
