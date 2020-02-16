import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/send/send_amount_sheet_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/send/send_confirm_sheet_view.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SendAmountSheetView extends StatefulWidget {
  final String address;
  final String paymentID;

  SendAmountSheetView(this.address, {this.paymentID = ""});

  @override
  _SendAmountSheetViewState createState() => _SendAmountSheetViewState();
}

class _SendAmountSheetViewState extends State<SendAmountSheetView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  FocusNode _amountFocusNode = FocusNode();
  TextEditingController _amountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SendAmountSheetModel>.withConsumer(
      viewModel: SendAmountSheetModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.state == ViewState.Busy,
        child: LayoutBuilder(
          builder: (context, constraints) => SafeArea(
            minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.035),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print("tap outside form");
                FocusScope.of(context).unfocus();
                _amountFocusNode.unfocus();
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
                                maxWidth:
                                    MediaQuery.of(context).size.width - 140),
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
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 30, right: 30),
                    child: locator.get<UIUtil>().oneLineTrimmedAddressText(
                        context, Provider.of<WalletState>(context).address),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (!model.isMax) {
                        // fix textselection bugs
                        // https://github.com/flutter/flutter/issues/35848
                        FocusScope.of(context).unfocus();
                        _amountTextController.text = UIUtil.trimBalance(
                          UIUtil.formatMoney12(
                              Provider.of<WalletState>(context).matureBalance),
                        );
                        _amountTextController.value = TextEditingValue(
                          text: UIUtil.trimBalance(
                            UIUtil.formatMoney12(
                                Provider.of<WalletState>(context)
                                    .matureBalance),
                          ),
                        );
                      }
                    },
                    child: Container(
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
                                    Provider.of<WalletState>(context)
                                        .matureBalance),
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
                            print("tap outside form, in stack");
                            FocusScope.of(context).unfocus();
                            _amountFocusNode.unfocus();
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
                            FormBuilder(
                              // context,
                              key: _fbKey,
                              autovalidate: false,
                              // readonly: true,
                              child: GestureDetector(
                                onTap: () {
                                  print("tap outside form");
                                  // Clear focus of our fields when tapped in this empty space
                                  _amountFocusNode.unfocus();
                                },
                                child: Column(
                                  children: <Widget>[
                                    // amount field
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                smallScreen(context) ? 20 : 30,
                                            right:
                                                smallScreen(context) ? 20 : 30,
                                            bottom: 15),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Provider.of<AppTheme>(context)
                                              .backgroundDarkest,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: FormBuilderTextField(
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter(
                                              RegExp("[0-9\.]"),
                                            ),
                                          ],
                                          readOnly: model.isMax == true,
                                          enabled: model.isMax != true,
                                          attribute: "amount",
                                          onChanged: (text) {
                                            model.clearErrors();
                                          },
                                          style: AppStyles
                                              .textStyleParagraphPrimary(
                                                  context),
                                          textAlign: TextAlign.center,
                                          cursorColor: model.isMax == true
                                              ? Provider.of<AppTheme>(context)
                                                  .primary20
                                              : Provider.of<AppTheme>(context)
                                                  .primary,
                                          keyboardAppearance: Brightness.dark,
                                          controller: _amountTextController,
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          decoration: InputDecoration(
                                            hintText: model.isMax
                                                ? "Send Everything"
                                                : "Enter amount",
                                            hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'NunitoSans',
                                              color: model.isMax == true
                                                  ? Provider.of<AppTheme>(
                                                          context)
                                                      .text20
                                                  : Provider.of<AppTheme>(
                                                          context)
                                                      .text60,
                                            ),
                                            prefixIcon: Icon(
                                                AppIcons.swapcurrency,
                                                size: 20,
                                                color: model.isMax == true
                                                    ? Provider.of<AppTheme>(
                                                            context)
                                                        .primary20
                                                    : Provider.of<AppTheme>(
                                                            context)
                                                        .primary),
                                            suffixIcon: IconButton(
                                              icon: Icon(AppIcons.paste,
                                                  size: 20,
                                                  color: model.isMax == true
                                                      ? Provider.of<AppTheme>(
                                                              context)
                                                          .primary20
                                                      : Provider.of<AppTheme>(
                                                              context)
                                                          .primary),
                                              onPressed: () async {
                                                ClipboardData data =
                                                    await Clipboard.getData(
                                                        'text/plain');
                                                // fix textselection bugs
                                                // https://github.com/flutter/flutter/issues/35848
                                                FocusScope.of(context)
                                                    .unfocus();
                                                _amountTextController.text =
                                                    data.text;
                                                _amountTextController.value =
                                                    TextEditingValue(
                                                        text: data.text);
                                              },
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validators: model.isMax == true
                                              ? []
                                              : [
                                                  FormBuilderValidators
                                                      .required(),
                                                ],
                                        ),
                                      ),
                                    ),
                                    // send all field
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                smallScreen(context) ? 20 : 30,
                                            right:
                                                smallScreen(context) ? 20 : 30,
                                            bottom: 15),
                                        width: double.infinity,
                                        child: FormBuilderSwitch(
                                          label: Text(
                                            'Send Everything',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w100,
                                                fontFamily: 'NunitoSans',
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .text60,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          attribute: "send_all",
                                          initialValue: false,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 8.0),
                                          ),
                                          onChanged: (val) {
//                                  print("switch: " + val.toString());
                                            model.setMax(val: val);
                                            if (model.isMax) {
                                              // fix textselection bugs
                                              // https://github.com/flutter/flutter/issues/35848
                                              FocusScope.of(context).unfocus();
                                              _amountTextController.text = "";
                                            }
                                            model.clearErrors();
                                          },
                                        ),
                                      ),
                                    ),
                                    model.errorMessage == null ||
                                            model.errorMessage == ""
                                        ? Container()
                                        : Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              model.errorMessage,
                                              textAlign: TextAlign.center,
                                              style: AppStyles
                                                  .textStyleErrorMedium(
                                                      context),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // end form
                  //A column with "Scan QR Code" and "Send" buttons
                  // Next button
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
                            _fbKey.currentState.save();
                            if (_fbKey.currentState.validate()) {
                              var canSend = await model.canSend(
                                widget.address,
                                _fbKey.currentState.value['amount'],
                                paymentID: widget.paymentID == null
                                    ? ""
                                    : widget.paymentID,
                              );

                              if (canSend) {
                                String amount;

                                if (model.isMax) {
                                  amount = UIUtil.trimBalance(
                                      UIUtil.formatMoney12(
                                          Provider.of<WalletState>(context)
                                                  .balance -
                                              model.txInfo.fee));
                                } else {
                                  amount = _fbKey.currentState.value['amount'];
                                }
                                showModalBottomSheetCustom(
                                  context: context,
                                  color:
                                      Provider.of<AppTheme>(context).background,
                                  radius: 20.0,
                                  maxHeightFactor: 15 / 16,
                                  builder: (BuildContext context) =>
                                      SendConfirmSheetView(
                                    widget.address,
                                    amount,
                                    model.txInfo,
                                    paymentID: widget.paymentID == null
                                        ? ""
                                        : widget.paymentID,
                                    isMax: model.isMax,
                                  ),
                                );
                              }
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
      ),
    );
  }
}
