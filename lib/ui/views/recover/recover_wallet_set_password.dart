import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_set_password_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/views/recover/set_topoheight_arguments.dart';
import 'package:dero/ui/widgets/password_field_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class RecoverWalletSetPasswordView extends StatefulWidget {
  final WalletRecoverMethod walletRecoverMethod;
  final String recoverData;

  RecoverWalletSetPasswordView(this.walletRecoverMethod, this.recoverData);

  @override
  _RecoverWalletSetPasswordViewState createState() =>
      _RecoverWalletSetPasswordViewState();
}

class _RecoverWalletSetPasswordViewState
    extends State<RecoverWalletSetPasswordView> {
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  // Mnemonic Phrase
  FocusNode _filenameFocusNode = FocusNode();
  TextEditingController _filenameController = TextEditingController();

  // Private Spend Key
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RecoverWalletSetPasswordModel>.withConsumer(
      viewModel: RecoverWalletSetPasswordModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Provider.of<AppTheme>(context).backgroundDark,
        body: LayoutBuilder(
          builder: (context, constraints) => SafeArea(
            minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.035,
                top: MediaQuery.of(context).size.height * 0.075),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          // Clear focus of our fields when tapped in this empty space
                          _passwordFocusNode.unfocus();
                          _filenameFocusNode.unfocus();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: SizedBox.expand(),
                          constraints: BoxConstraints.expand(),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              // Back Button
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: smallScreen(context) ? 15 : 20),
                                height: 50,
                                width: 50,
                                child: FlatButton(
                                  highlightColor:
                                      Provider.of<AppTheme>(context).text15,
                                  splashColor:
                                      Provider.of<AppTheme>(context).text15,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(AppIcons.back,
                                      color:
                                          Provider.of<AppTheme>(context).text,
                                      size: 24),
                                ),
                              ),
                            ],
                          ),
                          // The header
                          Container(
                            margin: EdgeInsetsDirectional.only(
                              start: smallScreen(context) ? 30 : 40,
                              end: smallScreen(context) ? 30 : 40,
                              top: 10,
                            ),
                            alignment: AlignmentDirectional(-1, 0),
                            child: AutoSizeText(
                              "Secure your wallet", // show header depends what type of recover method is selected.
                              style: AppStyles.textStyleHeaderColored(context),
                              maxLines: 1,
                              minFontSize: 12,
                              stepGranularity: 0.1,
                            ),
                          ),
                          // The paragraph
                          Container(
                            margin: EdgeInsets.only(
                                left: smallScreen(context) ? 30 : 40,
                                right: smallScreen(context) ? 30 : 40,
                                top: 15.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Enter your wallet name and password.",
                              style: AppStyles.textStyleParagraph(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          // The container for filename TextField
                          Container(
                            margin: EdgeInsets.only(
                                left: smallScreen(context) ? 30 : 40,
                                right: smallScreen(context) ? 30 : 40,
                                top: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Provider.of<AppTheme>(context)
                                  .backgroundDarkest,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            // Text Field for the seed
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent),
                              child: Column(
                                children: <Widget>[
                                  // MNEMONIC TextField
                                  TextField(
                                    focusNode: _filenameFocusNode,
                                    controller: _filenameController,
                                    textAlign: TextAlign.center,
                                    cursorColor:
                                        Provider.of<AppTheme>(context).primary,
                                    inputFormatters: [
//                                    SingleSpaceInputFormatter(),
//                                    LowerCaseTextFormatter(),
                                      WhitelistingTextInputFormatter(
                                        RegExp("[a-zA-Z0-9\._]"),
                                      ),
                                    ],
                                    textInputAction: TextInputAction.done,
                                    maxLines: null,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      hintText: "Enter wallet name",
                                      prefixIcon: Icon(
                                          Icons.account_balance_wallet,
                                          size: 20,
                                          color: Provider.of<AppTheme>(context)
                                              .primary),
                                      // Paste Button
                                      suffixIcon: AnimatedCrossFade(
                                        duration: Duration(milliseconds: 100),
                                        firstChild: Container(
                                          width: 48,
                                          height: 48,
                                          child: FlatButton(
                                            highlightColor:
                                                Provider.of<AppTheme>(context)
                                                    .primary15,
                                            splashColor:
                                                Provider.of<AppTheme>(context)
                                                    .primary30,
                                            child: Icon(AppIcons.paste,
                                                size: 20,
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .primary),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0)),
                                            padding: EdgeInsets.all(14.0),
                                            onPressed: () {},
                                          ),
                                        ),
                                        secondChild: SizedBox(),
                                        crossFadeState: model.validInput
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                      ),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                        color: Provider.of<AppTheme>(context)
                                            .text60,
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                    style: model.validInput
                                        ? AppStyles.textStyleParagraphPrimary(
                                            context)
                                        : AppStyles.textStyleParagraph(context),
                                    onChanged: (text) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // The container for password TextField
                          Container(
                            margin: EdgeInsets.only(
                                left: smallScreen(context) ? 30 : 40,
                                right: smallScreen(context) ? 30 : 40,
                                top: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Provider.of<AppTheme>(context)
                                  .backgroundDarkest,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            // Text Field for the seed
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent),
                              child: Column(
                                children: <Widget>[
                                  PasswordFieldView(
                                    hintText: "Enter password",
                                    textController: _passwordController,
                                    focusNode: _passwordFocusNode,
                                    onChanged: (text) {
                                      // clear errors message
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // "Invalid Seed" text that appears if the input is invalid
                          model.errorMessage == null || model.errorMessage == ""
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: smallScreen(context) ? 30 : 40,
                                      right: smallScreen(context) ? 30 : 40,
                                      top: 15.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    model.errorMessage,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Provider.of<AppTheme>(context)
                                          .primary,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Next Screen Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 30),
                      height: 50,
                      width: 50,
                      child: FlatButton(
                        highlightColor:
                            Provider.of<AppTheme>(context).primary15,
                        splashColor: Provider.of<AppTheme>(context).primary30,
                        onPressed: () async {
                          var validResult = await model.validateInput(
                              _filenameController.text,
                              _passwordController.text);
                          if (validResult) {
                            _filenameFocusNode.unfocus();
                            _passwordFocusNode.unfocus();

                            Navigator.pushNamed(
                              context,
                              "/recover-wallet-set-topoheight",
                              arguments: SetTopoheightArguments(
                                widget.walletRecoverMethod,
                                widget.recoverData,
                                _filenameController.text,
                                _passwordController.text,
                              ),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Icon(AppIcons.forward,
                            color: Provider.of<AppTheme>(context).primary,
                            size: 50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
