import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_import_seed_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/views/recover/set_password_arguments.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class RecoverWalletImportSeedView extends StatefulWidget {
  @override
  _RecoverWalletImportSeedViewState createState() =>
      _RecoverWalletImportSeedViewState();
}

class _RecoverWalletImportSeedViewState
    extends State<RecoverWalletImportSeedView> {
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  // Mnemonic Phrase
  FocusNode _seedFocusNode = FocusNode();
  TextEditingController _seedController = TextEditingController();

  // Private Spend Key
  FocusNode _privateSpendFocusNode = FocusNode();
  TextEditingController _privateSpendKeyController = TextEditingController();

  // View Key
  FocusNode _viewKeyInputFocusNode = FocusNode();
  TextEditingController _viewKeyKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RecoverWalletImportSeedModel>.withConsumer(
      viewModel: RecoverWalletImportSeedModel(),
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
                          _privateSpendFocusNode.unfocus();
                          _seedFocusNode.unfocus();
                          _viewKeyInputFocusNode.unfocus();
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              // Switch among Seed, Private Spend Key and View Key
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    end: smallScreen(context) ? 15 : 20),
                                height: 50,
                                width: 50,
                                child: FlatButton(
                                  highlightColor:
                                      Provider.of<AppTheme>(context).text15,
                                  splashColor:
                                      Provider.of<AppTheme>(context).text15,
                                  onPressed: () {
                                    model.changeRecoverType();
                                    model.clearErrorsMessage();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                      model.walletRecoverMethod ==
                                              WalletRecoverMethod.Seed
                                          ? AppIcons.seed
                                          : model.walletRecoverMethod ==
                                                  WalletRecoverMethod.SpendKey
                                              ? Icons.vpn_key
                                              : model.walletRecoverMethod ==
                                                      WalletRecoverMethod
                                                          .ViewKey
                                                  ? Icons.vpn_lock
                                                  : Icons.file_upload,
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
                              model.header,
                              // show header depends what type of recover method is selected.
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
                                top: 15.0,
                                bottom: 15.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.hint,
                              style: AppStyles.textStyleParagraph(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          // The container for the seed
                          Container(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: smallScreen(context) ? 20 : 30,
                                  right: smallScreen(context) ? 20 : 30,
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
                                child: model.walletRecoverMethod ==
                                        WalletRecoverMethod.Seed
                                    ?
                                    // MNEMONIC TextField
                                    TextField(
                                        focusNode: _seedFocusNode,
                                        controller: _seedController,
                                        textAlign: TextAlign.center,
                                        cursorColor:
                                            Provider.of<AppTheme>(context)
                                                .primary,
                                        inputFormatters: [
//                                    SingleSpaceInputFormatter(),
//                                    LowerCaseTextFormatter(),
                                          WhitelistingTextInputFormatter(
                                            RegExp("[a-zA-Z ]"),
                                          ),
                                        ],
                                        textInputAction: TextInputAction.done,
                                        maxLines: null,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          // Emtpy SizedBox
                                          prefixIcon: AnimatedCrossFade(
                                            duration:
                                                Duration(milliseconds: 100),
                                            firstChild: Container(
                                              width: 48,
                                              height: 48,
                                              child: FlatButton(
                                                highlightColor:
                                                    Provider.of<AppTheme>(
                                                            context)
                                                        .primary15,
                                                splashColor:
                                                    Provider.of<AppTheme>(
                                                            context)
                                                        .primary30,
                                                child: Icon(AppIcons.scan,
                                                    size: 20,
                                                    color:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0)),
                                                padding: EdgeInsets.all(14.0),
                                                onPressed: () async {
                                                  try {
                                                    String result =
                                                        await BarcodeScanner
                                                            .scan();
                                                    _seedController.text =
                                                        result;
                                                    _seedController.value =
                                                        TextEditingValue(
                                                            text: result);
                                                  } on Exception catch (e) {
                                                    print(e.toString());
                                                  }
                                                },
                                              ),
                                            ),
                                            secondChild: SizedBox(),
                                            crossFadeState: model.validInput
                                                ? CrossFadeState.showFirst
                                                : CrossFadeState.showSecond,
                                          ),
                                          // Paste Button
                                          suffixIcon: AnimatedCrossFade(
                                            duration:
                                                Duration(milliseconds: 100),
                                            firstChild: Container(
                                              width: 48,
                                              height: 48,
                                              child: FlatButton(
                                                highlightColor:
                                                    Provider.of<AppTheme>(
                                                            context)
                                                        .primary15,
                                                splashColor:
                                                    Provider.of<AppTheme>(
                                                            context)
                                                        .primary30,
                                                child: Icon(AppIcons.paste,
                                                    size: 20,
                                                    color:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0)),
                                                padding: EdgeInsets.all(14.0),
                                                onPressed: () async {
                                                  ClipboardData data =
                                                      await Clipboard.getData(
                                                          'text/plain');
                                                  // fix textselection bugs
                                                  // https://github.com/flutter/flutter/issues/35848
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  _seedController.text =
                                                      data.text;
                                                  _seedController.value =
                                                      TextEditingValue(
                                                          text: data.text);
                                                },
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
                                            color:
                                                Provider.of<AppTheme>(context)
                                                    .text60,
                                          ),
                                        ),
                                        keyboardType: TextInputType.text,
                                        style:
                                            AppStyles.textStyleParagraphPrimary(
                                                context),
                                        onChanged: (text) {
                                          model.clearErrorsMessage();
                                        },
                                      )
                                    : model.walletRecoverMethod ==
                                            WalletRecoverMethod.SpendKey
                                        ?
                                        // Spend Key TextField
                                        TextField(
                                            focusNode: _privateSpendFocusNode,
                                            controller:
                                                _privateSpendKeyController,
                                            textAlign: TextAlign.center,
                                            cursorColor:
                                                Provider.of<AppTheme>(context)
                                                    .primary,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter(
                                                RegExp("[a-f0-9]"),
                                              ),
                                              LengthLimitingTextInputFormatter(
                                                  64),
//                                    UpperCaseTextFormatter()
                                            ],
                                            textInputAction:
                                                TextInputAction.done,
                                            maxLines: null,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              // Emtpy SizedBox
                                              prefixIcon: AnimatedCrossFade(
                                                duration:
                                                    Duration(milliseconds: 100),
                                                firstChild: Container(
                                                  width: 48,
                                                  height: 48,
                                                  child: FlatButton(
                                                    highlightColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary15,
                                                    splashColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary30,
                                                    child: Icon(AppIcons.scan,
                                                        size: 20,
                                                        color: Provider.of<
                                                                    AppTheme>(
                                                                context)
                                                            .primary),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0)),
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    onPressed: () async {
                                                      try {
                                                        String result =
                                                            await BarcodeScanner
                                                                .scan();
                                                        _privateSpendKeyController
                                                            .text = result;
                                                        _privateSpendKeyController
                                                                .value =
                                                            TextEditingValue(
                                                                text: result);
                                                      } on Exception catch (e) {
                                                        print(e.toString());
                                                      }
                                                    },
                                                  ),
                                                ),
                                                secondChild: SizedBox(),
                                                crossFadeState: model.validInput
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                              ),
                                              // Paste Button
                                              suffixIcon: AnimatedCrossFade(
                                                duration:
                                                    Duration(milliseconds: 100),
                                                firstChild: Container(
                                                  width: 48,
                                                  height: 48,
                                                  child: FlatButton(
                                                    highlightColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary15,
                                                    splashColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary30,
                                                    child: Icon(AppIcons.paste,
                                                        size: 20,
                                                        color: Provider.of<
                                                                    AppTheme>(
                                                                context)
                                                            .primary),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0)),
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    onPressed: () async {
                                                      ClipboardData data =
                                                          await Clipboard
                                                              .getData(
                                                                  'text/plain');
                                                      // fix textselection bugs
                                                      // https://github.com/flutter/flutter/issues/35848
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      _privateSpendKeyController
                                                          .text = data.text;
                                                      _privateSpendKeyController
                                                              .value =
                                                          TextEditingValue(
                                                              text: data.text);
                                                    },
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
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .text60,
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            style: model.validInput
                                                ? AppStyles.textStyleSeed(
                                                    context)
                                                : AppStyles.textStyleSeedGray(
                                                    context),
                                            onChanged: (text) {
                                              model.clearErrorsMessage();
                                            },
                                          )
                                        // View Key TextField
                                        : TextField(
                                            focusNode: _viewKeyInputFocusNode,
                                            controller: _viewKeyKeyController,
                                            textAlign: TextAlign.center,
                                            cursorColor:
                                                Provider.of<AppTheme>(context)
                                                    .primary,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter(
                                                RegExp("[a-f0-9]"),
                                              ),
                                              LengthLimitingTextInputFormatter(
                                                  128),
//                                    UpperCaseTextFormatter()
                                            ],
                                            textInputAction:
                                                TextInputAction.done,
                                            maxLines: null,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              // Emtpy SizedBox
                                              prefixIcon: AnimatedCrossFade(
                                                duration:
                                                    Duration(milliseconds: 100),
                                                firstChild: Container(
                                                  width: 48,
                                                  height: 48,
                                                  child: FlatButton(
                                                    highlightColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary15,
                                                    splashColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary30,
                                                    child: Icon(AppIcons.scan,
                                                        size: 20,
                                                        color: Provider.of<
                                                                    AppTheme>(
                                                                context)
                                                            .primary),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0)),
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    onPressed: () async {
                                                      try {
                                                        String result =
                                                            await BarcodeScanner
                                                                .scan();
                                                        _viewKeyKeyController
                                                            .text = result;
                                                        _viewKeyKeyController
                                                                .value =
                                                            TextEditingValue(
                                                                text: result);
                                                      } on Exception catch (e) {
                                                        print(e.toString());
                                                      }
                                                    },
                                                  ),
                                                ),
                                                secondChild: SizedBox(),
                                                crossFadeState: model.validInput
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                              ),
                                              // Paste Button
                                              suffixIcon: AnimatedCrossFade(
                                                duration:
                                                    Duration(milliseconds: 100),
                                                firstChild: Container(
                                                  width: 48,
                                                  height: 48,
                                                  child: FlatButton(
                                                    highlightColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary15,
                                                    splashColor:
                                                        Provider.of<AppTheme>(
                                                                context)
                                                            .primary30,
                                                    child: Icon(AppIcons.paste,
                                                        size: 20,
                                                        color: Provider.of<
                                                                    AppTheme>(
                                                                context)
                                                            .primary),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0)),
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    onPressed: () async {
                                                      ClipboardData data =
                                                          await Clipboard
                                                              .getData(
                                                                  'text/plain');
                                                      // fix textselection bugs
                                                      // https://github.com/flutter/flutter/issues/35848
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      _viewKeyKeyController
                                                          .text = data.text;
                                                      _viewKeyKeyController
                                                              .value =
                                                          TextEditingValue(
                                                              text: data.text);
                                                    },
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
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .text60,
                                              ),
                                            ),
                                            keyboardType: TextInputType.text,
                                            style: model.validInput
                                                ? AppStyles.textStyleSeed(
                                                    context)
                                                : AppStyles.textStyleSeedGray(
                                                    context),
                                            onChanged: (text) {
                                              model.clearErrorsMessage();
                                            },
                                          ),
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
                        onPressed: () {
                          switch (model.walletRecoverMethod) {
                            case WalletRecoverMethod.Seed:
                              _seedFocusNode.unfocus();
                              model.setRecoverText(_seedController.value.text);
                              break;
                            case WalletRecoverMethod.SpendKey:
                              _privateSpendFocusNode.unfocus();
                              model.setRecoverText(
                                  _privateSpendKeyController.value.text);
                              break;
                            case WalletRecoverMethod.ViewKey:
                              _viewKeyInputFocusNode.unfocus();
                              model.setRecoverText(
                                  _viewKeyKeyController.value.text);
                              break;
                            default:
                          }

                          if (model.validateRecoverData()) {
                            Navigator.pushNamed(
                              context,
                              "/recover-wallet-set-password",
                              arguments: SetPasswordArguments(
                                model.walletRecoverMethod,
                                model.recoverText,
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
