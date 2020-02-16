import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/models/tx_info.pb.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/ui/widgets/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendCompleteSheetView extends StatelessWidget {
  final String address;
  final String amount;
  final String paymentID;
  final TxInfo txInfo;

  SendCompleteSheetView(this.address, this.amount, this.txInfo,
      {this.paymentID = ''});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      minimum:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
      child: Column(
        children: <Widget>[
          //A main container that holds the amount, address and "SENT TO" texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                // Success tick (icon)
//                Container(
//                  alignment: AlignmentDirectional(0, 0),
//                  margin: EdgeInsets.only(bottom: 25),
//                  child: Icon(Icons.done_outline,
//                      size: 100, color: Provider.of<AppTheme>(context).success),
//                ),
                // Container for the Amount Text
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.105,
                      right: MediaQuery.of(context).size.width * 0.105),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Provider.of<AppTheme>(context).backgroundDarkest,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // Amount text
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: amount.toString(),
                          style: TextStyle(
                            color: Provider.of<AppTheme>(context).success,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        TextSpan(
                          text: " DERO",
                          style: TextStyle(
                            color: Provider.of<AppTheme>(context).success,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container for the "SENT TO" text
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      // "SENT TO" text
                      Text(
                        "SENT TO",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                          color: Provider.of<AppTheme>(context).success,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ],
                  ),
                ),
                // The container for the address
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  margin: EdgeInsets.only(
                    left: smallScreen(context) ? 20 : 30,
                    right: smallScreen(context) ? 20 : 30,
                    bottom: 20.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Provider.of<AppTheme>(context).backgroundDarkest,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: locator.get<UIUtil>().fourLineAddressText(
                      context, address,
                      type: FourLineAddressTextType.SUCCESS, contactName: ""),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  margin: EdgeInsets.symmetric(
                      horizontal: smallScreen(context) ? 20 : 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Provider.of<AppTheme>(context).backgroundDarkest,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: AutoSizeText(
                    "Tips: It will take 8 blocks (~100 seconds) from now for your wallet to update new balance. An amount of balance will be locked until then.",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyleAddressText60(context),
                    maxLines: 5,
//                                  stepGranularity: 0.5,
                  ),
                ),
                // container for tx hash
              ],
            ),
          ),

          // CLOSE Button
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CopyButtonView("Copy Transaction Hash", txInfo.hash)
                  ],
                ),
                Row(
                  children: <Widget>[
                    AppButton.buildAppButton(
                      context,
                      AppButtonType.SUCCESS_OUTLINE,
                      "Close",
                      Dimens.BUTTON_BOTTOM_DIMENS,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
//                      Navigator.of(context).popUntil(ModalRoute.withName('/home'));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
