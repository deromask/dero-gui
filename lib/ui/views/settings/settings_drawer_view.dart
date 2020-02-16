import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/settings_drawer_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/settings/backup_seed/backup_seed_sheet_view.dart';
import 'package:dero/ui/views/settings/change_daemon/change_daemon_sheet_view.dart';
import 'package:dero/ui/views/settings/change_password/change_password_dialog_view.dart';
import 'package:dero/ui/views/settings/change_theme/change_theme_menu_view.dart';
import 'package:dero/ui/views/settings/change_wallet_name/change_wallet_name_dialog.dart';
import 'package:dero/ui/views/settings/delete_wallet/delete_wallet_confirm_dialog.dart';
import 'package:dero/ui/views/settings/rescan_blockchain/rescan_confirm_dialog_view.dart';
import 'package:dero/ui/views/settings/settings_list_item.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:dero/ui/widgets/confirm_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SettingsDrawerView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  SettingsDrawerView({this.scaffoldKey});

  @override
  _SettingsDrawerViewState createState() => _SettingsDrawerViewState();
}

class _SettingsDrawerViewState extends State<SettingsDrawerView> {
  bool notNull(Object o) => o != null;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SettingsDrawerModel>.withConsumer(
      viewModel: SettingsDrawerModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: model.onBackButtonPressed,
        child: ClipRect(
          child: Stack(
            children: <Widget>[
              Container(
                color: Provider.of<AppTheme>(context).backgroundDark,
                constraints: BoxConstraints.expand(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Provider.of<AppTheme>(context).backgroundDark,
                ),
                child: SafeArea(
                  minimum: EdgeInsets.only(
                    top: 60,
                  ),
                  child: Column(
                    children: <Widget>[
                      // A container for accounts area
                      Container(
                        margin: EdgeInsetsDirectional.only(
                            start: 26.0, end: 20, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Main Account
                                Container(
                                  margin:
                                      EdgeInsetsDirectional.only(start: 4.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width: smallScreen(context) ? 63 : 78,
                                          height:
                                              smallScreen(context) ? 63 : 78,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1.5,
                                                color: Provider.of<AppTheme>(
                                                        context)
                                                    .primary),
                                          ),
                                          child: SizedBox(),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Container(
                                              width: smallScreen(context)
                                                  ? 55
                                                  : 70,
                                              height: smallScreen(context)
                                                  ? 55
                                                  : 70,
//                                    alignment: AlignmentDirectional(0, 0),
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    "assets/images/logo_no_background.png"),
                                              )),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: smallScreen(context) ? 63 : 78,
                                          height:
                                              smallScreen(context) ? 63 : 78,
                                          child: FlatButton(
                                            highlightColor:
                                                Provider.of<AppTheme>(context)
                                                    .backgroundDark
                                                    .withOpacity(0.75),
                                            splashColor:
                                                Provider.of<AppTheme>(context)
                                                    .backgroundDark
                                                    .withOpacity(0.75),
                                            padding: EdgeInsets.all(0.0),
                                            child: SizedBox(
                                              width: smallScreen(context)
                                                  ? 63
                                                  : 78,
                                              height: smallScreen(context)
                                                  ? 63
                                                  : 78,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//                                     A row for wallet info
                                Container(
                                  child: FlatButton(
                                    highlightColor:
                                        Provider.of<AppTheme>(context).text15,
                                    splashColor:
                                        Provider.of<AppTheme>(context).text30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    onPressed: () {
//                        AccountDetailsSheet(
//                            StateContainer.of(context).selectedAccount)
//                            .mainBottomSheet(context);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Main account name
                                        Container(
                                          child: Text(
                                            UIUtil.getWalletFilename(
                                                Provider.of<WalletState>(
                                                        context)
                                                    .walletPath),
                                            style: TextStyle(
                                              fontFamily: "NunitoSans",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
                                              color:
                                                  Provider.of<AppTheme>(context)
                                                      .text,
                                            ),
                                          ),
                                        ),
                                        // Main account address
                                        Container(
                                          child: Text(
                                            Provider.of<WalletState>(context)
                                                        .address
                                                        .length <
                                                    5
                                                ? ""
                                                : Provider.of<WalletState>(
                                                            context)
                                                        .address
                                                        .substring(0, 4) +
                                                    "..." +
                                                    Provider.of<WalletState>(
                                                            context)
                                                        .address
                                                        .substring(
                                                            Provider.of<WalletState>(
                                                                        context)
                                                                    .address
                                                                    .length -
                                                                6),
                                            style: TextStyle(
                                              fontFamily: "OverpassMono",
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14.0,
                                              color:
                                                  Provider.of<AppTheme>(context)
                                                      .text60,
                                            ),
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
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            ListView(
                              padding: EdgeInsets.only(top: 15.0),
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 30.0, bottom: 10),
                                  child: Text(
                                    "Manage",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w100,
                                        color: Provider.of<AppTheme>(context)
                                            .text60),
                                  ),
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Change Password",
                                  AppIcons.lock,
                                  onPressed: () {
                                    // https://stackoverflow.com/questions/52898617/avoid-widget-lock-for-setstate-in-the-onpress-button
                                    // Pop the drawer before updating the state to avoid "widget tree was locked" error
                                    Navigator.pop(context);
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          ChangePasswordDialogView(),
                                    );
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Backup Wallet",
                                  AppIcons.backupseed,
                                  onPressed: () async {
                                    // https://stackoverflow.com/questions/52898617/avoid-widget-lock-for-setstate-in-the-onpress-button
                                    // Pop the drawer before updating the state to avoid "widget tree was locked" error
                                    Navigator.pop(context);

                                    var authorized = await showDialog<bool>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return ConfirmPasswordDialog();
                                      },
                                    );
                                    if (authorized == true) {
                                      // at this time, context has changed
                                      // we need to use home page context to get app theme data
                                      showModalBottomSheetCustom(
                                        context:
                                            widget.scaffoldKey.currentContext,
                                        color: Provider.of<AppTheme>(
                                          widget.scaffoldKey.currentContext,
                                          listen: false,
                                        ).background,
                                        radius: 20.0,
                                        maxHeightFactor: 14 / 16,
                                        builder: (BuildContext context) =>
                                            BackupSeedSheetView(),
                                      );
                                    }
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Rename Wallet",
                                  Icons.edit,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          ChangeWalletNameDialogView(),
                                    );
//                                    // https://stackoverflow.com/questions/52898617/avoid-widget-lock-for-setstate-in-the-onpress-button
//                                    // Pop the drawer before updating the state to avoid "widget tree was locked" error
//                                    Navigator.pop(context);
//
//                                    bool hasPermission = false;
//
//                                    PermissionStatus permission =
//                                        await PermissionHandler()
//                                            .checkPermissionStatus(
//                                                PermissionGroup.storage);
//
//                                    if (permission == PermissionStatus.denied) {
//                                      Map<PermissionGroup, PermissionStatus>
//                                          permissions =
//                                          await PermissionHandler()
//                                              .requestPermissions(
//                                                  [PermissionGroup.storage]);
//
//                                      if (permissions[
//                                              PermissionGroup.storage] ==
//                                          PermissionStatus.granted) {
//                                        hasPermission = true;
//                                      }
//                                    } else {
//                                      hasPermission = true;
//                                    }
//
//                                    if (!hasPermission) return;
//
//                                    final externalDirectory =
//                                        await getExternalStorageDirectory();
//
//                                    Navigator.of(context).push<FolderPicker>(
//                                        MaterialPageRoute(
//                                            builder: (BuildContext context) {
//                                      return FolderPicker(
//                                          rootDirectory: externalDirectory,
//
//                                          /// a [Directory] object
//                                          action: (BuildContext context,
//                                              Directory folder) async {
//                                            print("Picked folder $folder");
//                                          });
//                                    }));
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Delete Wallet",
                                  Icons.delete,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                          DeleteWalletConfirmDialogView(),
                                    );
//                                    // https://stackoverflow.com/questions/52898617/avoid-widget-lock-for-setstate-in-the-onpress-button
//                                    // Pop the drawer before updating the state to avoid "widget tree was locked" error
//                                    Navigator.pop(context);
//
//                                    bool hasPermission = false;
//
//                                    PermissionStatus permission =
//                                        await PermissionHandler()
//                                            .checkPermissionStatus(
//                                                PermissionGroup.storage);
//
//                                    if (permission == PermissionStatus.denied) {
//                                      Map<PermissionGroup, PermissionStatus>
//                                          permissions =
//                                          await PermissionHandler()
//                                              .requestPermissions(
//                                                  [PermissionGroup.storage]);
//
//                                      if (permissions[
//                                              PermissionGroup.storage] ==
//                                          PermissionStatus.granted) {
//                                        hasPermission = true;
//                                      }
//                                    } else {
//                                      hasPermission = true;
//                                    }
//
//                                    if (!hasPermission) return;
//
//                                    final externalDirectory =
//                                        await getExternalStorageDirectory();
//
//                                    Navigator.of(context).push<FolderPicker>(
//                                        MaterialPageRoute(
//                                            builder: (BuildContext context) {
//                                      return FolderPicker(
//                                          rootDirectory: externalDirectory,
//
//                                          /// a [Directory] object
//                                          action: (BuildContext context,
//                                              Directory folder) async {
//                                            print("Picked folder $folder");
//                                          });
//                                    }));
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Contacts",
                                  AppIcons.contact,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context)
                                        .pushNamed("/contacts");
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 30.0, top: 20.0, bottom: 10.0),
                                  child: Text(
                                    "Preferences",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w100,
                                        color: Provider.of<AppTheme>(context)
                                            .text60),
                                  ),
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemDoubleLine(
                                  context,
                                  "Change Theme",
                                  Provider.of<AppTheme>(context).name,
                                  AppIcons.theme,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) =>
                                          ChangeThemeMenuView(),
                                    );
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemDoubleLine(
                                  context,
                                  "Change Daemon",
                                  Provider.of<WalletState>(context)
                                      .daemonAddress,
                                  Icons.link,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showModalBottomSheetCustom(
                                      context: context,
                                      color: Provider.of<AppTheme>(
                                        context,
                                        listen: false,
                                      ).background,
                                      radius: 20.0,
                                      maxHeightFactor: 14 / 16,
                                      builder: (BuildContext context) =>
                                          ChangeDaemonSheetView(),
                                    );
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                    context,
                                    "Rescan Blockchain",
                                    Icons.autorenew, onPressed: () {
                                  // https://stackoverflow.com/questions/52898617/avoid-widget-lock-for-setstate-in-the-onpress-button
                                  // Pop the drawer before updating the state to avoid "widget tree was locked" error
                                  Navigator.pop(context);
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        RescanConfirmDialogView(),
                                  );
                                }),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                AppSettings.buildSettingsListItemSingleLine(
                                  context,
                                  "Logout",
                                  AppIcons.logout,
                                  onPressed: () async {
                                    bool success = await model.logout();
                                    if (success) {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/welcome',
                                              (Route<dynamic> route) => false);
                                    } else {
                                      print("logout fail");
                                    }
                                  },
                                ),
                                Divider(
                                  height: 2,
                                  color: Provider.of<AppTheme>(context).text15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 20,
                                      right: 20),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "v1.1.1",
                                        style:
                                            AppStyles.textStyleVersion(context),
                                      ),
                                      Text(
                                        " | ",
                                        style:
                                            AppStyles.textStyleVersion(context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          model.launchURL(
                                              "https://deromask.io/privacy");
                                        },
                                        child: Text(
                                          "Privacy Policy",
                                          style: AppStyles
                                              .textStyleVersionUnderline(
                                                  context),
                                        ),
                                      ),
                                      Text(
                                        " | ",
                                        style:
                                            AppStyles.textStyleVersion(context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          model.launchURL(
                                              "https://deromask.io/tos");
                                        },
                                        child: Text(
                                          "ToS",
                                          style: AppStyles
                                              .textStyleVersionUnderline(
                                                  context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].where(notNull).toList(),
                            ),
                            //List Top Gradient End
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 20.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Provider.of<AppTheme>(context)
                                          .backgroundDark,
                                      Provider.of<AppTheme>(context)
                                          .backgroundDark00
                                    ],
                                    begin: AlignmentDirectional(0.5, -1.0),
                                    end: AlignmentDirectional(0.5, 1.0),
                                  ),
                                ),
                              ),
                            ), //List Top Gradient End
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//              SlideTransition(
//                  position: _offsetFloat, child: ContactsList(_controller, _contactsOpen)),
//              SlideTransition(
//                  position: _securityOffsetFloat,
//                  child: buildSecurityMenu(context)),
            ],
          ),
        ),
      ),
    );
  }
}
