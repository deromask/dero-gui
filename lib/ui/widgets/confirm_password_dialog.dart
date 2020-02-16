import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/password_field_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ConfirmPasswordDialog extends StatefulWidget {
  @override
  _ConfirmPasswordDialogState createState() => _ConfirmPasswordDialogState();
}

class _ConfirmPasswordDialogState extends State<ConfirmPasswordDialog> {
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ConfirmPasswordDialogModel>.withConsumer(
      viewModel: ConfirmPasswordDialogModel(),
      builder: (context, model, child) => Theme(
        data: ThemeData(
            dialogBackgroundColor: Provider.of<AppTheme>(context).background),
        child: Builder(
          builder: (context) {
            return Container(
              child: AlertDialog(
                title: Text(
                  'Confirm password',
                  style: AppStyles.textStyleSettingItemHeader(context),
                ),
                contentPadding:
                    const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Theme(
                      data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Provider.of<AppTheme>(context).backgroundDarkest,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: PasswordFieldView(
                          hintText: "enter password",
                          textController: _passwordTextController,
                          enabled: model.state != ViewState.Busy,
                          onChanged: (text) {
                            model.clearErrorMessage();
                          },
                        ),
                      ),
                    ),
                    model.errorMessage != null && model.errorMessage != ""
                        ? Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              model.errorMessage,
                              style: AppStyles.textStyleErrorMedium(context),
                            ),
                          )
                        : Container()
                  ],
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text(
                      'CONFIRM',
                      style: model.state == ViewState.Busy
                          ? AppStyles.textStyleParagraph(context)
                          : AppStyles.textStyleParagraphPrimary(context),
                    ),
                    onPressed: () async {
                      bool valid = await model
                          .checkPassword(_passwordTextController.value.text);
                      if (valid == true) {
                        Navigator.pop(context, valid);
                      }
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      'CANCEL',
                      style: AppStyles.textStyleParagraph(context),
                    ),
                    onPressed: () async {
                      Navigator.pop(context, null);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ConfirmPasswordDialogModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  BoolResult checkPasswordResult;

  String errorMessage;

  Future<bool> checkPassword(String password) async {
    setState(ViewState.Busy);
    var valid = false;

    try {
      checkPasswordResult = await _deroCore.checkPassword(password);
      print(checkPasswordResult.toString());
      valid = checkPasswordResult.result;
      errorMessage = "";
    } on Exception catch (e) {
      valid = false;
      print("exception:" + e.toString());
      errorMessage = e.toString();
    }

    if (valid == false) {
      errorMessage = "invalid password";
    } else {
      errorMessage = "";
    }
    setState(ViewState.Idle);
    return valid;
  }

  void clearErrorMessage() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}
