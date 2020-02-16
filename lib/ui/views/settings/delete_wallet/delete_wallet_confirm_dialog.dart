import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/delete_wallet/delete_wallet_confirm_dialog_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/password_field_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class DeleteWalletConfirmDialogView extends StatefulWidget {
  @override
  _DeleteWalletConfirmDialogViewState createState() =>
      _DeleteWalletConfirmDialogViewState();
}

class _DeleteWalletConfirmDialogViewState
    extends State<DeleteWalletConfirmDialogView> {
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DeleteWalletConfirmDialogModel>.withConsumer(
      viewModel: DeleteWalletConfirmDialogModel(),
      builder: (context, model, child) => Theme(
        data: ThemeData(
            dialogBackgroundColor: Provider.of<AppTheme>(context).background),
        child: Builder(
          builder: (context) {
            return AlertDialog(
              title: Text(
                  'Delete Wallet ${UIUtil.getWalletFilename(Provider.of<WalletState>(context).walletPath)}?',
                  style: AppStyles.textStyleSettingItemHeader(context)),
              contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
              content: Container(
                width: double.minPositive,
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      AutoSizeText(
                        "Are you sure you want to delete wallet? This action cannot be undone.",
                        textAlign: TextAlign.left,
                        style: AppStyles.textStyleParagraph(context),
//                        maxLines: 1,
//                                  stepGranularity: 0.5,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent),
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Provider.of<AppTheme>(context)
                                .backgroundDarkest,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: PasswordFieldView(
                            hintText: "enter password",
                            textController: _passwordTextController,
                            enabled: model.state != ViewState.Busy,
                            onChanged: (text) {
                              model.clear();
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
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text(
                    'CONFIRM DELETE',
                    style: model.state == ViewState.Busy
                        ? AppStyles.textStyleParagraph(context)
                        : AppStyles.textStyleParagraphPrimary(context),
                  ),
                  onPressed: () async {
                    bool success = await model
                        .deleteWallet(_passwordTextController.value.text);
                    if (success) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/welcome', (Route<dynamic> route) => false);
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
