import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/settings/change_password/change_password_dialog_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/password_field_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ChangePasswordDialogView extends StatefulWidget {
  @override
  _ChangePasswordDialogViewState createState() =>
      _ChangePasswordDialogViewState();
}

class _ChangePasswordDialogViewState extends State<ChangePasswordDialogView> {
  final TextEditingController _oldPasswordTextController =
      TextEditingController();
  final TextEditingController _newPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ChangePasswordDialogModel>.withConsumer(
      viewModel: ChangePasswordDialogModel(),
      builder: (context, model, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Theme(
          data: ThemeData(
              dialogBackgroundColor: Provider.of<AppTheme>(context).background),
          child: Builder(
            builder: (context) {
              return AlertDialog(
                title: Text('Change Password',
                    style: AppStyles.textStyleSettingItemHeader(context)),
                contentPadding:
                    const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                content: Container(
//                width: double.minPositive + 32,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Provider.of<AppTheme>(context)
                                .backgroundDarkest,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: PasswordFieldView(
                            hintText: "enter old password",
                            textController: _oldPasswordTextController,
                            enabled: model.state != ViewState.Busy,
                            onChanged: (text) {
                              model.clear();
                            },
                          ),
                        ),
                        model.errorMessage != null && model.errorMessage != ""
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  model.errorMessage,
                                  style:
                                      AppStyles.textStyleErrorMedium(context),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 30,
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Provider.of<AppTheme>(context)
                                .backgroundDarkest,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: PasswordFieldView(
                            hintText: "enter new password",
                            textController: _newPasswordTextController,
                            enabled: model.state != ViewState.Busy,
                            onChanged: (text) {
                              model.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      bool success = await model.changePassword(
                        _oldPasswordTextController.text,
                        _newPasswordTextController.text,
                      );
                      if (success) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  new FlatButton(
                    child: new Text(
                      'CANCEL',
                      style: AppStyles.textStyleParagraph(context),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
