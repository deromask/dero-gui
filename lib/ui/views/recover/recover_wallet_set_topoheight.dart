import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_set_topoheight_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class RecoverWalletSetTopoheightView extends StatefulWidget {
  final WalletRecoverMethod walletRecoverMethod;
  final String recoverData;
  final String filename;
  final String password;

  RecoverWalletSetTopoheightView(
      this.walletRecoverMethod, this.recoverData, this.filename, this.password);

  @override
  _RecoverWalletSetTopoheightViewState createState() =>
      _RecoverWalletSetTopoheightViewState();
}

class _RecoverWalletSetTopoheightViewState
    extends State<RecoverWalletSetTopoheightView> {
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  // Mnemonic Phrase
  FocusNode _topoheightFocusNode = FocusNode();
  TextEditingController _topoheightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RecoverWalletSetTopoheightModel>.withConsumer(
      viewModel: RecoverWalletSetTopoheightModel(),
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
                          _topoheightFocusNode.unfocus();
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
                              "Set TopoHeight", // show header depends what type of recover method is selected.
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
                              "Wallet will start syncing from this topoheight. Type in the topoheight of the very first transaction. This will save you some time. If you don't know which topoheight to use, let it to zero.",
                              style: AppStyles.textStyleParagraph(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          // The container for the seed
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
                              child: TextField(
                                focusNode: _topoheightFocusNode,
                                controller: _topoheightController,
                                textAlign: TextAlign.center,
                                cursorColor:
                                    Provider.of<AppTheme>(context).primary,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                                textInputAction: TextInputAction.done,
                                maxLines: null,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Enter start topo height",
                                  prefixIcon: AnimatedCrossFade(
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
                                        child: Icon(AppIcons.scan,
                                            size: 20,
                                            color:
                                                Provider.of<AppTheme>(context)
                                                    .primary),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0)),
                                        padding: EdgeInsets.all(14.0),
                                        onPressed: () {},
                                      ),
                                    ),
                                    secondChild: SizedBox(),
                                    crossFadeState: CrossFadeState.showFirst,
                                  ),
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
                                            color:
                                                Provider.of<AppTheme>(context)
                                                    .primary),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0)),
                                        padding: EdgeInsets.all(14.0),
                                        onPressed: () async {
                                          ClipboardData data =
                                              await Clipboard.getData(
                                                  'text/plain');
                                          // fix textselection bugs
                                          // https://github.com/flutter/flutter/issues/35848
                                          FocusScope.of(context).unfocus();
                                          _topoheightController.text =
                                              data.text;
                                          _topoheightController.value =
                                              TextEditingValue(text: data.text);
                                        },
                                      ),
                                    ),
                                    secondChild: SizedBox(),
                                    crossFadeState: CrossFadeState.showFirst,
                                  ),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color:
                                        Provider.of<AppTheme>(context).text60,
                                  ),
                                ),
                                style: AppStyles.textStyleParagraphPrimary(
                                    context),
                                onChanged: (text) {},
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
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // Send Button
                          AppButton.buildAppButton(
                            context,
                            AppButtonType.PRIMARY,
                            'Recover Wallet',
                            Dimens.BUTTON_TOP_DIMENS,
                            onPressed: () async {
                              Int64 startTopoHeight = Int64(0);
                              try {
                                if (_topoheightController.text != "" &&
                                    _topoheightController.text != null) {
                                  startTopoHeight = Int64.parseInt(
                                      _topoheightController.text);
                                }
                              } on Exception {
                                // do nothing
                              }

                              var success = await model.openWallet(
                                  widget.filename,
                                  widget.password,
                                  widget.walletRecoverMethod,
                                  widget.recoverData,
                                  startHeight: startTopoHeight);
                              if (success) {
                                Navigator.pushNamed(context, '/home');
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          // Scan QR Code Button
                          AppButton.buildAppButton(
                            context,
                            AppButtonType.PRIMARY_OUTLINE,
                            'Cancel',
                            Dimens.BUTTON_BOTTOM_DIMENS,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
