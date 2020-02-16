import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/home/account_detail_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class AccountDetailSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AccountDetailSheetModel>.withConsumer(
      viewModel: AccountDetailSheetModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.state == ViewState.Busy,
        child: SafeArea(
          minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.035,
              left: 20,
              right: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // WALLET NAME TEXT
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Column(
                        children: <Widget>[
                          AutoSizeText(
                            UIUtil.getWalletFilename(
                                    Provider.of<WalletState>(context)
                                        .walletPath) +
                                (Provider.of<WalletState>(context).isViewOnly
                                    ? " (view only)"
                                    : ""),
                            style: AppStyles.textStyleHeader(context),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            stepGranularity: 0.1,
                          ),
                          AutoSizeText(
                            "Location: " +
                                Provider.of<WalletState>(context).walletPath,
                            style: AppStyles.textStyleParagraph(context),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            stepGranularity: 0.1,
                          ),
                        ],
                      ),
                    ),
                    // BALANCE
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "BALANCE",
                            style: AppStyles.textStyleHeader(context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            "Unlocked: ${UIUtil.trimBalance(
                              UIUtil.formatMoney12(
                                  Provider.of<WalletState>(context)
                                      .matureBalance),
                            )}",
                            style: AppStyles.textStyleParagraph(context),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            stepGranularity: 0.1,
                          ),
                          AutoSizeText(
                            "Locked: ${UIUtil.trimBalance(
                              UIUtil.formatMoney12(
                                  Provider.of<WalletState>(context)
                                      .lockedBalance),
                            )}",
                            style: AppStyles.textStyleParagraph(context),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            stepGranularity: 0.1,
                          ),
                        ],
                      ),
                    ),
                    // SYNCING STATUS
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "SYNCING STATUS",
                            style: AppStyles.textStyleHeader(context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            "Height: ${Provider.of<WalletState>(context).height}/${Provider.of<WalletState>(context).daemonHeight}",
                            style: AppStyles.textStyleParagraph(context),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            stepGranularity: 0.1,
                          ),
                          AutoSizeText(
                            "TopoHeight: ${Provider.of<WalletState>(context).topoHeight}/${Provider.of<WalletState>(context).daemonTopoHeight}",
                            style: AppStyles.textStyleParagraph(context),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            stepGranularity: 0.1,
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
                    // A row for CONFIRM Button
                    Row(
                      children: <Widget>[
                        // CONFIRM Button
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          Provider.of<WalletState>(context).mode
                              ? "STOP SYNCING"
                              : "START SYNCING",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () async {
                            //                          // todo turn on/off sync on tap
//                          // fix responsive because syncing not happen right away
                            await model.setWalletMode(!Provider.of<WalletState>(
                              context,
                              listen: false,
                            ).mode);
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
        ),
      ),
    );
  }
}
