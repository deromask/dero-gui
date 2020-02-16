import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/settings/rescan_blockchain/rescan_confirm_dialog_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class RescanConfirmDialogView extends StatefulWidget {
  @override
  _RescanConfirmDialogViewState createState() =>
      _RescanConfirmDialogViewState();
}

class _RescanConfirmDialogViewState extends State<RescanConfirmDialogView> {
  final TextEditingController _startheightTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RescanConfirmDialogModel>.withConsumer(
      viewModel: RescanConfirmDialogModel(),
      builder: (context, model, child) => Theme(
        data: ThemeData(
            dialogBackgroundColor: Provider.of<AppTheme>(context).background),
        child: Builder(
          builder: (context) {
            return AlertDialog(
              title: Text('Rescan Blockchain',
                  style: AppStyles.textStyleSettingItemHeader(context)),
              contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Provider.of<AppTheme>(context).backgroundDarkest,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: TextField(
                        controller: _startheightTextController,
                        enabled: model.state != ViewState.Busy,
                        style: AppStyles.textStyleParagraphPrimary(context),
                        textAlign: TextAlign.center,
                        cursorColor: Provider.of<AppTheme>(context).primary,
                        keyboardAppearance: Brightness.dark,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: false),
                        decoration: InputDecoration(
                          hintText: "enter start topo height",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'NunitoSans',
                            color: Provider.of<AppTheme>(context).text60,
                          ),
                        ),
                        onChanged: (text) {
                          model.onTextFieldChange(text);
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
                  child: new Text('CONFIRM',
                      style: AppStyles.textStyleParagraphPrimary(context)),
                  onPressed: () async {
                    bool result =
                        await model.rescan(_startheightTextController.text);
                    print("rescan dialog result: " + result.toString());
                    if (result) {
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
    );
  }
}
