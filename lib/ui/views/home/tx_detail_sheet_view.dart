import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/models/transfer_details.pb.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TxDetailSheetView extends StatelessWidget {
  final TransferDetails transferDetail;

  TxDetailSheetView(this.transferDetail);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
      child: Column(
        children: <Widget>[
          // WALLET NAME TEXT
          Container(
            margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
            child: Column(
              children: <Widget>[
                AutoSizeText(
                  "TRANSACTION DETAIL",
                  style: AppStyles.textStyleHeader(context),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  stepGranularity: 0.1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
//              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: smallScreen(context) ? 30 : 40),
                  child: ListView(
                    children: <Widget>[
                      FlatButton(
                        child: AutoSizeText(
                          "ID: ${transferDetail.txid}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(text: transferDetail.txid),
                          );
                          showFloatingFlushbar("TxID copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Type: ${transferDetail.type}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(text: transferDetail.type),
                          );
                          showFloatingFlushbar("Type copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Amount: ${UIUtil.trimBalance(
                            UIUtil.formatMoney12(transferDetail.amount),
                          )} DERO",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(
                                text: transferDetail.amount.toString()),
                          );
                          showFloatingFlushbar("Amount copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Block Height: ${transferDetail.blockHeight}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(
                                text: transferDetail.blockHeight.toString()),
                          );
                          showFloatingFlushbar("Block Height copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Block Topo Height: ${transferDetail.blockTopoheight}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(
                                text:
                                    transferDetail.blockTopoheight.toString()),
                          );
                          showFloatingFlushbar(
                              "Block Topo Height copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Unlock time: ${transferDetail.unlockTime == 0 ? "N/A" : transferDetail.unlockTime}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(
                                text: transferDetail.unlockTime.toString()),
                          );
                          showFloatingFlushbar("Unlock time copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Payment ID: ${transferDetail.paymentId == "" ? "N/A" : transferDetail.paymentId}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(text: transferDetail.paymentId),
                          );
                          showFloatingFlushbar("Payment ID copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Fee: ${transferDetail.fee == 0 ? "N/A" : transferDetail.fee}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(
                                text: transferDetail.fee.toString()),
                          );
                          showFloatingFlushbar("Fee copied", context);
                        },
                      ),
                      Divider(
                        height: 2,
                        color: Provider.of<AppTheme>(context).text15,
                      ),
                      FlatButton(
                        child: AutoSizeText(
                          "Secret Key: ${transferDetail.secretTxKey == "" ? "N/A" : transferDetail.secretTxKey}",
                          style: AppStyles.textStyleParagraph(context),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          stepGranularity: 0.1,
                        ),
                        onPressed: () async {
                          Clipboard.setData(
                            new ClipboardData(text: transferDetail.secretTxKey),
                          );
                          showFloatingFlushbar("Secret Key copied", context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //A container for CONFIRM and CANCEL buttons
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // CONFIRM Button
                    AppButton.buildAppButton(
                      context,
                      AppButtonType.PRIMARY,
                      "Open In Explorer",
                      Dimens.BUTTON_TOP_DIMENS,
                      onPressed: () async {
                        String url = "https://explorer.dero.io/tx/" +
                            transferDetail.txid.toLowerCase();
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // do nothing
                        }
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
                        "CLOSE",
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
    );
  }

  void showFloatingFlushbar(String message, BuildContext context) {
    Flushbar(
      borderRadius: 8,
      duration: Duration(seconds: 1),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Provider.of<AppTheme>(context).backgroundDarkest,
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      isDismissible: true,
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: "Transaction Detail",
      message: message,
    )..show(context);
  }
}
