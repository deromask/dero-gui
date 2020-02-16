import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DappsView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<AppTheme>(context).backgroundDark,
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
        child: Container(
          decoration: BoxDecoration(
            color: Provider.of<AppTheme>(context).backgroundDark,
            boxShadow: [
              BoxShadow(
                  color: Provider.of<AppTheme>(context).overlay30,
                  offset: Offset(-5, 0),
                  blurRadius: 20),
            ],
          ),
          child: Column(
            children: <Widget>[
              // Contacts list + top and bottom gradients
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      "Under Development",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyleHeaderColored(context),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    AppButton.buildAppButton(
                      context,
                      AppButtonType.TEXT_OUTLINE,
                      "HOME",
                      Dimens.BUTTON_BOTTOM_DIMENS,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
