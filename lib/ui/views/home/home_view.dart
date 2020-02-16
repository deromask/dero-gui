import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/config.dart';
import 'package:dero/core/models/get_transfers.pb.dart';
import 'package:dero/core/models/transfer_details.pb.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/home/home_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/home/account_detail_sheet_view.dart';
import 'package:dero/ui/views/home/tx_detail_sheet_view.dart';
import 'package:dero/ui/views/receive/receive_sheet_view.dart';
import 'package:dero/ui/views/send/send_address_sheet_view.dart';
import 'package:dero/ui/views/settings/settings_drawer_view.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return ViewModelProvider<HomeModel>.withConsumer(
      viewModel: HomeModel(),
      onModelReady: (model) => {},
      builder: (context, model, child) => WillPopScope(
        onWillPop: () => Future<bool>.value(false),
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          drawer: Theme(
            data: ThemeData(
              canvasColor: Colors.transparent,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Drawer(
                child: SettingsDrawerView(
                  scaffoldKey: _scaffoldKey,
                ),
              ),
            ),
          ),
          backgroundColor: Provider.of<AppTheme>(context).background,
          body: SafeArea(
            minimum: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // start main card
                Container(
                  decoration: BoxDecoration(
                    color: Provider.of<AppTheme>(context).backgroundDark,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [Provider.of<AppTheme>(context).boxShadow],
                  ),
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setHeight(14),
                    right: ScreenUtil().setHeight(14),
                    top: ScreenUtil().setHeight(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // settings button
                      Container(
                        width: ScreenUtil().setWidth(90),
                        height: ScreenUtil().setWidth(120),
                        alignment: AlignmentDirectional(-1, -1),
                        child: Container(
                          margin: EdgeInsetsDirectional.only(top: 5, start: 5),
                          height: 50,
                          width: 50,
                          child: FlatButton(
                              highlightColor:
                                  Provider.of<AppTheme>(context).text15,
                              splashColor:
                                  Provider.of<AppTheme>(context).text15,
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
//                                    Scaffold.of(context).openDrawer();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.settings,
                                  color: Provider.of<AppTheme>(context).text,
                                  size: 24)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
//                          // todo turn on/off sync on tap
//                          // fix responsive because syncing not happen right away
//                          await model.setWalletMode(
//                              !Provider.of<WalletState>(context).mode);
                          showModalBottomSheetCustom(
                            context: context,
                            color: Provider.of<AppTheme>(context, listen: false)
                                .background,
                            radius: 20.0,
                            maxHeightFactor: 15 / 16,
                            builder: (BuildContext context) {
                              return AccountDetailSheetView();
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(14)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  AutoSizeText(
//                                    UIUtil.getWalletFilename(
//                                            Provider.of<WalletState>(context)
//                                                .walletPath) +
//                                        (Provider.of<WalletState>(context)
//                                                .isViewOnly
//                                            ? " (view only)"
//                                            : ""),
                                    "~ USD " +
                                        UIUtil.trimBalance(
                                            (Provider.of<WalletState>(context)
                                                        .price *
                                                    UIUtil.money12(Provider.of<
                                                                WalletState>(
                                                            context)
                                                        .balance))
                                                .toStringAsFixed(3)),
                                    style:
                                        AppStyles.textStyleCurrencyAlt(context),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    stepGranularity: 0.1,
                                  ),
                                ],
                              ),
                              // start balance text
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth:
                                                ScreenUtil().setWidth(400),
                                          ),
                                          child: AutoSizeText.rich(
                                            TextSpan(
                                              text: "DERO " +
                                                  UIUtil.trimBalance(
                                                    UIUtil.formatMoney12(
                                                        Provider.of<WalletState>(
                                                                context)
                                                            .balance),
                                                  ),
                                              style: Provider.of<WalletState>(
                                                          context)
                                                      .mode
                                                  ? AppStyles.textStyleCurrency(
                                                      context)
                                                  : AppStyles
                                                      .textStyleCurrencyDisabled(
                                                          context),
                                            ),
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(18),
                                            ),
                                            stepGranularity: 0.1,
                                            minFontSize: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Provider.of<WalletState>(context)
                                                .lockedBalance ==
                                            0
                                        ? Container()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            225),
                                                child: AutoSizeText.rich(
                                                  TextSpan(
                                                    text: "Unlocked: " +
                                                        UIUtil.trimBalance(
                                                          UIUtil.formatMoney12(
                                                              Provider.of<WalletState>(
                                                                      context)
                                                                  .matureBalance),
                                                        ) +
                                                        ", Locked: " +
                                                        UIUtil.trimBalance(
                                                          UIUtil.formatMoney12(
                                                              Provider.of<WalletState>(
                                                                      context)
                                                                  .lockedBalance),
                                                        ),
                                                    style: Provider.of<
                                                                    WalletState>(
                                                                context)
                                                            .mode
                                                        ? AppStyles
                                                            .textStyleHeader(
                                                                context)
                                                        : AppStyles
                                                            .textStyleCurrencyDisabled(
                                                                context),
                                                  ),
                                                  maxLines: 1,
                                                  style:
                                                      TextStyle(fontSize: 28.0),
                                                  stepGranularity: 0.1,
                                                  minFontSize: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              // end balance text
                              // start sync status text
                              Row(
                                children: <Widget>[
                                  Provider.of<WalletState>(context).mode
                                      ? Icon(Icons.sync,
                                          color: Colors.lightBlue, size: 16)
                                      : Icon(Icons.sync_disabled,
                                          color: Colors.blueGrey, size: 16),
                                  Text(
                                      "${Provider.of<WalletState>(context).topoHeight}/${Provider.of<WalletState>(context).daemonTopoHeight}",
                                      textAlign: TextAlign.center,
                                      style: AppStyles.textStyleCurrencyAlt(
                                          context)),
                                ],
                              ),
                              // end sync status text
                            ],
                          ),
                        ),
                      ),
                      // logout button
                      Container(
                        width: ScreenUtil().setWidth(90),
                        height: ScreenUtil().setWidth(120),
                        alignment: AlignmentDirectional(1, -1),
                        child: Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 5, start: 5, end: 10),
                          height: 50,
                          width: 60,
                          child: FlatButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: Provider.of<AppTheme>(context).background,
                            highlightColor:
                                Provider.of<AppTheme>(context).text15,
                            splashColor: Provider.of<AppTheme>(context).text15,
                            onPressed: () async {
                              Navigator.pushNamed(context, '/dapps');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: AutoSizeText(
                              "DApps",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyleHeaderColored(context),
                              maxLines: 1,
//                                  stepGranularity: 0.5,
                            ),
//                                Icon(Icons.exit_to_app,
//                                    color: Provider.of<AppTheme>(context).text,
//                                    size: 24),
                          ),
                        ),
                      ), // end logout button
                    ],
                  ),
                ),
                // end main card
                // start transaction card
                //Transactions Text
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 26.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          'TRANSACTIONS',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15.0),
                            fontWeight: FontWeight.w100,
                            color: Provider.of<AppTheme>(context).text,
                          ),
                        ),
                        onTap: () async {
                          await model.getTransactions();
                        },
                      ),
                    ],
                  ),
                ), //
                //Transactions List
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      RefreshIndicator(
                        backgroundColor:
                            Provider.of<AppTheme>(context).backgroundDark,
                        child: ListView(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 5.0, 0, 15.0),
                          children: model.transactions == null
                              ? <Widget>[
                                  _buildWelcomeTransactionCard(context),
                                ]
                              : model.transactions?.desc == null ||
                                      model.transactions.desc.length == 0
                                  ? <Widget>[_buildNoTransactionCard(context)]
                                  : _buildList(model.transactions, context),
                        ),
                        onRefresh: () async {
                          await model.getTransactions();
//                              if (result) {
//                                print(model.transactions.toString());
//                              }
                        },
                      ),
                      //List Top Gradient End
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 10.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Provider.of<AppTheme>(context).background00,
                                Provider.of<AppTheme>(context).background
                              ],
                              begin: AlignmentDirectional(0.5, 1.0),
                              end: AlignmentDirectional(0.5, -1.0),
                            ),
                          ),
                        ),
                      ), // List Top Gradient End

                      //List Bottom Gradient
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 30.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Provider.of<AppTheme>(context).background00,
                                Provider.of<AppTheme>(context).background
                              ],
                              begin: AlignmentDirectional(0.5, -1),
                              end: AlignmentDirectional(0.5, 0.5),
                            ),
                          ),
                        ),
                      ), //List Bottom Gradient End
                    ],
                  ),
                ), //Transactions List End
                // end transaction card
                // start buttons
//                Container(
//                  child: Text(
//                    "contacts:" +
//                        Provider.of<List<Contact>>(context).length.toString(),
//                  ),
//                ),
                Container(
                  color: Provider.of<AppTheme>(context).background,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              Provider.of<AppTheme>(context).boxShadowButton
                            ],
                          ),
                          height: 55,
                          margin: EdgeInsetsDirectional.only(
                              start: 14, top: 0.0, end: 7.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            color: Provider.of<AppTheme>(context).primary,
                            child: AutoSizeText(
                              "Receive",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyleButtonPrimary(context),
                              maxLines: 1,
                              stepGranularity: 0.5,
                            ),
                            onPressed: () {
                              showModalBottomSheetCustom(
                                context: context,
                                color: Provider.of<AppTheme>(context,
                                        listen: false)
                                    .background,
                                radius: 20.0,
                                maxHeightFactor: 15 / 16,
                                builder: (BuildContext context) {
                                  return ReceiveSheetView();
                                },
                              );
                            },
                            highlightColor:
                                Provider.of<AppTheme>(context).background40,
                            splashColor:
                                Provider.of<AppTheme>(context).background40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              Provider.of<AppTheme>(context).boxShadowButton
                            ],
                          ),
                          height: 55,
                          margin: EdgeInsetsDirectional.only(
                              start: 7, top: 0.0, end: 14.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            color:
                                model.canSend(Provider.of<WalletState>(context))
                                    ? Provider.of<AppTheme>(context).primary
                                    : Provider.of<AppTheme>(context).primary60,
                            child: AutoSizeText(
                              "Send",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyleButtonPrimary(context),
                              maxLines: 1,
                              stepGranularity: 0.5,
                            ),
                            onPressed: () {
                              if (model
                                  .canSend(Provider.of<WalletState>(context)))
                                showModalBottomSheetCustom(
                                  context: context,
                                  color: Provider.of<AppTheme>(
                                    context,
                                    listen: false,
                                  ).background,
                                  radius: 20.0,
                                  maxHeightFactor: 15 / 16,
                                  builder: (BuildContext context) {
                                    return SendAddressSheetView();
                                  },
                                );
                            },
                            highlightColor: (Provider.of<WalletState>(context)
                                            .balance !=
                                        null &&
                                    Provider.of<WalletState>(context).balance >
                                        0)
                                ? Provider.of<AppTheme>(context).background40
                                : Colors.transparent,
                            splashColor: (Provider.of<WalletState>(context)
                                            .balance !=
                                        null &&
                                    Provider.of<WalletState>(context).balance >
                                        0)
                                ? Provider.of<AppTheme>(context).background40
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // end buttons
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildList(
      GetTransfersResult transactions, BuildContext context) {
    var widgets = <Widget>[];
    transactions.desc.forEach((i) {
      widgets.add(_buildTransactionCard(i, context));
    });
    return widgets;
  }

  Widget _buildTransactionCard(TransferDetails tx, BuildContext context) {
    String text;
    IconData icon;
    Color iconColor;
    if (tx.type == "out") {
      text = "Sent";
      icon = Icons.remove_circle_outline;
      iconColor = Provider.of<AppTheme>(context).text60;
    } else {
      text = "Received";
      icon = Icons.add_circle_outline;
      iconColor = Provider.of<AppTheme>(context).primary60;
    }
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
      decoration: BoxDecoration(
        color: Provider.of<AppTheme>(context).backgroundDark,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [Provider.of<AppTheme>(context).boxShadow],
      ),
      child: FlatButton(
        onPressed: () {
          showModalBottomSheetCustom(
            context: context,
            color: Provider.of<AppTheme>(context, listen: false).background,
            radius: 20.0,
            maxHeightFactor: 15 / 16,
            builder: (BuildContext context) {
              return TxDetailSheetView(tx);
            },
          );
        },
        highlightColor: Provider.of<AppTheme>(context).text15,
        splashColor: Provider.of<AppTheme>(context).text15,
        color: Provider.of<AppTheme>(context).backgroundDark,
        padding: EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsetsDirectional.only(end: 16.0),
                        child: Icon(icon, color: iconColor, size: 20)),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            text,
                            textAlign: TextAlign.start,
                            style: AppStyles.textStyleTransactionType(context),
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: UIUtil.trimBalance(
                                      UIUtil.formatMoney12(tx.amount)),
                                  style: AppStyles.textStyleTransactionAmount(
                                      context),
                                ),
                                TextSpan(
                                  text: " DERO",
                                  style: AppStyles.textStyleTransactionUnit(
                                      context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "block: " + tx.blockHeight.toString(),
                        textAlign: TextAlign.end,
                        style: AppStyles.textStyleTransactionAddress(context),
                      ),
                      Text(
                        "txid: " +
                            UIUtil.middleTrimmedText(tx.txid,
                                start: 3, subend: 4),
                        textAlign: TextAlign.end,
                        style: AppStyles.textStyleTransactionAddress(context),
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

  Widget _buildWelcomeTransactionCard(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
      decoration: BoxDecoration(
        color: Provider.of<AppTheme>(context).backgroundDark,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [Provider.of<AppTheme>(context).boxShadow],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: Provider.of<AppTheme>(context).primary,
                boxShadow: [Provider.of<AppTheme>(context).boxShadow],
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Welcome to DeroMask. Your transactions will show up here. Pull to refresh.",
                    style: AppStyles.textStyleTransactionWelcome(context),
                  ),
                ),
              ),
            ),
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: Provider.of<AppTheme>(context).primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoTransactionCard(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(14.0, 4.0, 14.0, 4.0),
      decoration: BoxDecoration(
        color: Provider.of<AppTheme>(context).backgroundDark,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [Provider.of<AppTheme>(context).boxShadow],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: Provider.of<AppTheme>(context).primary,
                boxShadow: [Provider.of<AppTheme>(context).boxShadow],
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "No transactions found!",
                    style: AppStyles.textStyleTransactionWelcome(context),
                  ),
                ),
              ),
            ),
            Container(
              width: 7.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: Provider.of<AppTheme>(context).primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
