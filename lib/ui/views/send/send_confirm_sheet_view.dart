import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/tx_info.pb.dart';
import 'package:dero/core/viewmodels/send/send_confirm_sheet_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/send/send_complete_sheet_view.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/ui/widgets/confirm_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SendConfirmSheetView extends StatelessWidget {
  final String address;
  final String amount;
  final String paymentID;
  final TxInfo txInfo;
  final bool isMax;

  SendConfirmSheetView(this.address, this.amount, this.txInfo,
      {this.paymentID = '', this.isMax = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SendConfirmSheetModel>.withConsumer(
      viewModel: SendConfirmSheetModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.state == ViewState.Busy,
        child: SafeArea(
          minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.035),
          child: Column(
            children: <Widget>[
              //The main widget that holds the text fields, "SENDING" and "TO" texts
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // "SENDING" TEXT
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "SENDING",
                            style: AppStyles.textStyleHeader(context),
                          ),
                        ],
                      ),
                    ),
                    // Container for the amount text
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.105,
                          right: MediaQuery.of(context).size.width * 0.105),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Provider.of<AppTheme>(context).backgroundDarkest,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // Amount text
                      child: Column(
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: UIUtil.trimBalance(amount.toString()),
                                  style: TextStyle(
                                    color:
                                        Provider.of<AppTheme>(context).primary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                                TextSpan(
                                  text: " DERO",
                                  style: TextStyle(
                                    color:
                                        Provider.of<AppTheme>(context).primary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Fee: " +
                                    UIUtil.trimBalance(
                                      UIUtil.formatMoney12(this.txInfo.fee),
                                    ) +
                                    " dero",
                                style: AppStyles.textStyleAddressPrimary60(
                                    context)),
                          ),
                        ],
                      ),
                    ),
                    // "TO" text
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "TO",
                            style: AppStyles.textStyleHeader(context),
                          ),
                        ],
                      ),
                    ),
                    // Address text
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.105,
                          right: MediaQuery.of(context).size.width * 0.105),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Provider.of<AppTheme>(context).backgroundDarkest,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: locator.get<UIUtil>().fourLineAddressText(
                          context, address,
                          contactName: ""),
                    ),
                    // payment id

                    paymentID == null || paymentID == ""
                        ? Container()
                        : Column(
                            children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(top: 30.0, bottom: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Payment ID",
                                      style: AppStyles.textStyleHeader(context),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.105,
                                    right: MediaQuery.of(context).size.width *
                                        0.105),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Provider.of<AppTheme>(context)
                                      .backgroundDarkest,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  paymentID,
                                  textAlign: TextAlign.center,
                                  style:
                                      AppStyles.textStyleAddressText90(context),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),

              //A container for CONFIRM and CANCEL buttons
              Container(
                child: Column(
                  children: <Widget>[
                    // A row for CONFIRM Button
                    Row(
                      children: <Widget>[
                        // CONFIRM Button
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          "CONFIRM",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () async {
                            var authorized = await showDialog<bool>(
                              context: context,
                              barrierDismissible: true, // user must tap button!
                              builder: (BuildContext context) {
                                return ConfirmPasswordDialog();
                              },
                            );
                            if (authorized == true) {
                              await model.send(txInfo);
                              showModalBottomSheetCustom(
                                context: context,
                                color:
                                    Provider.of<AppTheme>(context).background,
                                radius: 20.0,
                                maxHeightFactor: 15 / 16,
                                builder: (BuildContext context) =>
                                    SendCompleteSheetView(
                                  address,
                                  amount,
                                  txInfo,
                                  paymentID: paymentID,
                                ),
                              );
                            }
                            // password false and null is handled in dialog
                          },
                        ),
                      ],
                    ),
                    // A row for CANCEL Button
                    Row(
                      children: <Widget>[
                        // CANCEL Button
                        AppButton.buildAppButton(
                            context,
                            AppButtonType.PRIMARY_OUTLINE,
                            "CANCEL",
                            Dimens.BUTTON_BOTTOM_DIMENS, onPressed: () {
                          Navigator.of(context).pop();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
