import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/change_wallet_name/change_wallet_name_dialog_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ChangeWalletNameDialogView extends StatefulWidget {
  @override
  _ChangeWalletNameDialogViewState createState() =>
      _ChangeWalletNameDialogViewState();
}

class _ChangeWalletNameDialogViewState
    extends State<ChangeWalletNameDialogView> {
  final TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ChangeWalletNameDialogModel>.withConsumer(
      viewModel: ChangeWalletNameDialogModel(),
      builder: (context, model, child) => Theme(
        data: ThemeData(
            dialogBackgroundColor: Provider.of<AppTheme>(context).background),
        child: Builder(
          builder: (context) {
            return AlertDialog(
              title: Text(
                  'Rename: ${UIUtil.getWalletFilename(Provider.of<WalletState>(context).walletPath)}?',
                  style: AppStyles.textStyleSettingItemHeader(context)),
              contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
              content: Container(
                width: double.minPositive,
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      AutoSizeText(
                        "You will need to re-login after changing wallet name.",
                        textAlign: TextAlign.left,
                        style: AppStyles.textStyleParagraph(context),
//                        maxLines: 1,
//                                  stepGranularity: 0.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Provider.of<AppTheme>(context)
                                .backgroundDarkest,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent),
                            child: TextField(
                              enabled: model.state != ViewState.Busy,
                              controller: _nameTextController,
                              style:
                                  AppStyles.textStyleParagraphPrimary(context),
                              textAlign: TextAlign.center,
                              cursorColor:
                                  Provider.of<AppTheme>(context).primary,
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                hintText: "enter new name",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'NunitoSans',
                                  color: Provider.of<AppTheme>(context).text60,
                                ),
                              ),
                              onChanged: (text) {
                                model.clear();
                              },
                            ),
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
                    bool success = await model
                        .changeWalletName(_nameTextController.value.text);
                    if (success) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/open-wallet', (Route<dynamic> route) => false);
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
