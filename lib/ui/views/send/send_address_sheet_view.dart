import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/send/send_address_sheet_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/send/send_amount_sheet_view.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SendAddressSheetView extends StatefulWidget {
  final String address;

  SendAddressSheetView([this.address]);

  @override
  _SendAddressSheetViewState createState() => _SendAddressSheetViewState();
}

class _SendAddressSheetViewState extends State<SendAddressSheetView> {
//  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
//  FocusNode _amountFocusNode = FocusNode();
//  TextEditingController _amountTextController = TextEditingController();
  FocusNode _addressFocusNode = FocusNode();
  TextEditingController _addressTextController = TextEditingController();
  FocusNode _paymentIdFocusNode = FocusNode();
  TextEditingController _paymentIdController = TextEditingController();

  @override
  initState() {
    super.initState();
    if (widget.address != null) {
      _addressTextController.text = widget.address;
      _addressTextController.value = TextEditingValue(text: widget.address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SendAddressSheetModel>.withConsumer(
      viewModel: SendAddressSheetModel(),
      builder: (context, model, child) => SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              // A row for the header of the sheet, balance text and close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Empty SizedBox
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),

                  // Container for the header, address and balance text and sheet handle
                  Column(
                    children: <Widget>[
                      // Sheet handle
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 5,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Provider.of<AppTheme>(context).text10,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 140),
                        child: Column(
                          children: <Widget>[
                            // Header
                            AutoSizeText(
                              'SEND FROM',
                              style: AppStyles.textStyleHeader(context),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              stepGranularity: 0.1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Empty SizedBox
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              // Address Text
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  // send to ourself
                  // fix textselection bugs
                  // https://github.com/flutter/flutter/issues/35848
                  FocusScope.of(context).unfocus();
                  _addressTextController.text =
                      Provider.of<WalletState>(context).address;
                  _addressTextController.value = TextEditingValue(
                      text: Provider.of<WalletState>(context).address);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, left: 30, right: 30),
                  child: locator.get<UIUtil>().oneLineTrimmedAddressText(
                      context, Provider.of<WalletState>(context).address),
                ),
              ),
              Container(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '',
                    children: [
                      TextSpan(
                        text: "(Unlocked: ",
                        style: TextStyle(
                          color: Provider.of<AppTheme>(context).primary60,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      TextSpan(
                        text: UIUtil.trimBalance(
                          UIUtil.formatMoney12(
                              Provider.of<WalletState>(context).matureBalance),
                        ),
                        style: TextStyle(
                          color: Provider.of<AppTheme>(context).primary60,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      TextSpan(
                        text: " DERO)",
                        style: TextStyle(
                          color: Provider.of<AppTheme>(context).primary60,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              // form
              Expanded(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Clear focus of our fields when tapped in this empty space
//                        _amountFocusNode.unfocus();
                        FocusScope.of(context).unfocus();
                        _addressFocusNode.unfocus();
                        _paymentIdFocusNode.unfocus();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: SizedBox.expand(),
                        constraints: BoxConstraints.expand(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: smallScreen(context) ? 20 : 30,
                                right: smallScreen(context) ? 20 : 30,
                                bottom: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Provider.of<AppTheme>(context)
                                  .backgroundDarkest,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              controller: _addressTextController,
                              maxLines: null,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                  RegExp("[a-zA-Z0-9]"),
                                ),
                              ],
                              onChanged: (text) {
                                model.clearErrors();
                              },
                              style:
                                  AppStyles.textStyleParagraphPrimary(context),
                              textAlign: TextAlign.center,
                              cursorColor:
                                  Provider.of<AppTheme>(context).primary,
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                hintText: "Enter address",
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    AppIcons.scan,
                                    size: 20,
                                    color:
                                        Provider.of<AppTheme>(context).primary,
                                  ),
                                  onPressed: () async {
                                    try {
                                      String result =
                                          await BarcodeScanner.scan();
                                      // fix textselection bugs
                                      // https://github.com/flutter/flutter/issues/35848
                                      FocusScope.of(context).unfocus();
                                      _addressTextController.text = result;
                                      _addressTextController.value =
                                          TextEditingValue(text: result);
                                    } on Exception catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(AppIcons.paste,
                                      size: 20,
                                      color: Provider.of<AppTheme>(context)
                                          .primary),
                                  onPressed: () async {
                                    ClipboardData data =
                                        await Clipboard.getData('text/plain');
                                    // fix textselection bugs
                                    // https://github.com/flutter/flutter/issues/35848
                                    FocusScope.of(context).unfocus();
                                    _addressTextController.text = data.text;
                                    _addressTextController.value =
                                        TextEditingValue(text: data.text);
                                  },
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'NunitoSans',
                                  color: Provider.of<AppTheme>(context).text60,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        // payment id field
                        Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: smallScreen(context) ? 20 : 30,
                                right: smallScreen(context) ? 20 : 30,
                                bottom: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Provider.of<AppTheme>(context)
                                  .backgroundDarkest,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                  RegExp("[0-9a-z]"),
                                ),
                              ],
                              onChanged: (text) {
                                model.clearErrors();
                              },
                              textInputAction: TextInputAction.done,
                              style:
                                  AppStyles.textStyleParagraphPrimary(context),
                              textAlign: TextAlign.center,
                              maxLines: null,
                              cursorColor:
                                  Provider.of<AppTheme>(context).primary,
                              keyboardAppearance: Brightness.dark,
                              controller: _paymentIdController,
//                                    keyboardType:
//                                        TextInputType.numberWithOptions(
//                                            decimal: true),
                              decoration: InputDecoration(
                                hintText: "Payment ID (optional)",
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'NunitoSans',
                                  color: Provider.of<AppTheme>(context).text60,
                                ),
                                prefixIcon: Icon(Icons.payment,
                                    size: 20,
                                    color:
                                        Provider.of<AppTheme>(context).primary),
                                suffixIcon: IconButton(
                                  icon: Icon(AppIcons.paste,
                                      size: 20,
                                      color: Provider.of<AppTheme>(context)
                                          .primary),
                                  onPressed: () async {
                                    ClipboardData data =
                                        await Clipboard.getData('text/plain');
                                    // fix textselection bugs
                                    // https://github.com/flutter/flutter/issues/35848
                                    FocusScope.of(context).unfocus();
                                    _paymentIdController.text = data.text;
                                    _paymentIdController.value =
                                        TextEditingValue(text: data.text);
                                  },
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        model.errorMessage == null || model.errorMessage == ""
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  model.errorMessage,
                                  textAlign: TextAlign.center,
                                  style:
                                      AppStyles.textStyleErrorMedium(context),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              // end form
              // Next button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 30),
                    height: 50,
                    width: 50,
                    child: FlatButton(
                      highlightColor: Provider.of<AppTheme>(context).primary15,
                      splashColor: Provider.of<AppTheme>(context).primary30,
                      onPressed: () async {
                        bool validInput = await model.validateInput(
                          _addressTextController.text,
                          paymentID: _paymentIdController.text,
                        );

                        if (validInput == true) {
                          showModalBottomSheetCustom(
                            context: context,
                            color: Provider.of<AppTheme>(context).background,
                            radius: 20.0,
                            maxHeightFactor: 15 / 16,
                            builder: (BuildContext context) =>
                                SendAmountSheetView(
                              _addressTextController.text,
                              paymentID: _paymentIdController.text,
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
    );
  }
}
