import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/change_daemon/change_daemon_sheet_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/ui/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ChangeDaemonSheetView extends StatefulWidget {
  @override
  _ChangeDaemonSheetViewState createState() => _ChangeDaemonSheetViewState();
}

class _ChangeDaemonSheetViewState extends State<ChangeDaemonSheetView> {
  final TextEditingController _daemonTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ChangeDaemonSheetModel>.withConsumer(
        viewModel: ChangeDaemonSheetModel(),
        onModelReady: (model) {
          model.setSelectedDaemon(
              Provider.of<WalletState>(context).daemonAddress);
        },
        builder: (context, model, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              child: ModalProgressHUD(
                inAsyncCall: model.state == ViewState.Busy,
                child: SafeArea(
                  minimum: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.035,
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // page title
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 15.0),
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 140),
                              child: Column(
                                children: <Widget>[
                                  // Header
                                  AutoSizeText(
                                    'CHANGE DAEMON',
                                    style: AppStyles.textStyleHeader(context),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    stepGranularity: 0.1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ), // end page title
                      // start form
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: smallScreen(context) ? 10 : 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: AutoSizeText(
                                  "Select preferered:",
                                  style: AppStyles.textStyleParagraphPrimary(
                                      context),
                                  maxLines: 1,
                                  stepGranularity: 0.1,
                                ),
                              ),
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
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    canvasColor: Provider.of<AppTheme>(context)
                                        .backgroundDarkest,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        hint: Text("select daemon address"),
                                        value: model.selectedDaemon,
                                        style:
                                            AppStyles.textStyleParagraphPrimary(
                                                context),
                                        onChanged: (String newValue) {
                                          model.setSelectedDaemon(newValue);
                                        },
                                        items: model.daemons
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .text,
                                                fontFamily: 'NunitoSans',
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: smallScreen(context) ? 20 : 30),
                                child: AutoSizeText(
                                  "Or enter custom:",
                                  style: AppStyles.textStyleParagraphPrimary(
                                      context),
                                  maxLines: 1,
                                  stepGranularity: 0.1,
                                ),
                              ),
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
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    canvasColor: Provider.of<AppTheme>(context)
                                        .backgroundDarkest,
                                  ),
                                  child: TextField(
                                    controller: _daemonTextController,
                                    style: AppStyles.textStyleParagraphPrimary(
                                        context),
                                    textAlign: TextAlign.center,
                                    cursorColor:
                                        Provider.of<AppTheme>(context).primary,
                                    keyboardAppearance: Brightness.dark,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "enter daemon address",
                                      hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w100,
                                        fontFamily: 'NunitoSans',
                                        color: Provider.of<AppTheme>(context)
                                            .text60,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), // end form
                      ),
                      // start error message
                      model.errorMessage != null
                          ? Text(model.errorMessage,
                              style: TextStyle(color: Colors.red))
                          : Container(), // end error message
                      // control button
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                // Send Button
                                AppButton.buildAppButton(
                                  context,
                                  AppButtonType.PRIMARY,
                                  'Change Daemon',
                                  Dimens.BUTTON_TOP_DIMENS,
                                  onPressed: () async {
                                    var success = await model.changeDaemon(
                                        _daemonTextController.value.text);
                                    if (success) {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            SuccessDialogWidget("Success"),
                                      );
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
        });
  }
}
