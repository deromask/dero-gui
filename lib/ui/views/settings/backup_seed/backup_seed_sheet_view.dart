import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/wallet_backup_method.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/backup_seed/backup_seed_sheet_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/ui/widgets/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class BackupSeedSheetView extends StatefulWidget {
  @override
  _BackupSeedSheetViewState createState() => _BackupSeedSheetViewState();
}

// @todo separate backup method to its own class

class _BackupSeedSheetViewState extends State<BackupSeedSheetView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BackupSeedSheetModel>.withConsumer(
      viewModel: BackupSeedSheetModel(),
      onModelReady: (model) {
        model.changeBackupMethod(Provider.of<WalletState>(context));
      },
      builder: (context, model, child) => Container(
        child: SafeArea(
          minimum: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.035,
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              model.changeBackupMethod(
                Provider.of<WalletState>(
                  context,
                  listen: false,
                ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 60, height: 60),
                          // Sheet handle and Header
                          Column(
                            children: <Widget>[
                              // Header text
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 5,
                                width: MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                  color: Provider.of<AppTheme>(context).text10,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              //A container for the header
                              Container(
                                margin: EdgeInsets.only(top: 15.0),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width -
                                            140),
                                child: Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      model.backupTextTitle.toUpperCase(),
                                      style: AppStyles.textStyleHeader(context),
                                      maxLines: 1,
                                      stepGranularity: 0.1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Switch button
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsetsDirectional.only(
                                top: 10.0, end: 10.0),
                            child: FlatButton(
                              highlightColor:
                                  Provider.of<AppTheme>(context).text15,
                              splashColor:
                                  Provider.of<AppTheme>(context).text15,
                              onPressed: () {
                                model.changeBackupMethod(
                                  Provider.of<WalletState>(
                                    context,
                                    listen: false,
                                  ),
                                );
                              },
                              child: Icon(
                                  model.backupMethod == WalletBackupMethod.Seed
                                      ? AppIcons.seed
                                      : model.backupMethod ==
                                              WalletBackupMethod.SpendKey
                                          ? Icons.vpn_key
                                          : model.backupMethod ==
                                                  WalletBackupMethod.File
                                              ? Icons.file_download
                                              : Icons.vpn_lock,
                                  size: 24,
                                  color: Provider.of<AppTheme>(context).text),
                              padding: EdgeInsets.all(13.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //A container for the paragraph and seed
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      width: MediaQuery.of(context).size.width - 30,
                      child: model.backupMethod == WalletBackupMethod.File
                          ? BackupFileView(
                              () {
                                model.changeBackupMethod(
                                  Provider.of<WalletState>(context,
                                      listen: false),
                                );
                              },
                            )
                          : BackupTextView(
                              model.backupTextTitle,
                              model.backupMethod,
                              () {
                                model.changeBackupMethod(
                                  Provider.of<WalletState>(context,
                                      listen: false),
                                );
                              },
                            ),
                    ),
                  ),
                  //A row with copy button
                  Row(
                    children: <Widget>[
                      Container(
                        child: model.backupMethod == WalletBackupMethod.File
                            ? AppButton.buildAppButton(
                                context,
                                // Share Address Button
                                AppButtonType.PRIMARY,
                                "Export",
                                Dimens.BUTTON_TOP_DIMENS,
                                onPressed: () async {
                                  model.shareWalletFile(
                                      Provider.of<WalletState>(context,
                                              listen: false)
                                          .walletPath);
                                },
                              )
                            : CopyButtonView(
                                "Copy " + model.backupTextTitle,
                                model.copyBackupText(
                                  Provider.of<WalletState>(context),
                                ),
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

// showing backup text and warning message
class BackupTextView extends StatelessWidget {
  final String backupText;
  final WalletBackupMethod backupMethod;
  final VoidCallback onChangeBackupMethodCallback;

  const BackupTextView(
      this.backupText, this.backupMethod, this.onChangeBackupMethodCallback);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AutoSizeText(
          "Below is your wallet's " +
              backupText +
              ". It is crucial that you backup this secret and never store it as plain text or a screenshot.",
          textAlign: TextAlign.start,
          style: AppStyles.textStyleParagraph(context),
          stepGranularity: 0.5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//                              margin: EdgeInsets.only(
//                                  left:
//                                      MediaQuery.of(context).size.width * 0.05,
//                                  right:
//                                      MediaQuery.of(context).size.width * 0.05),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Provider.of<AppTheme>(context).backgroundDarkest,
            borderRadius: BorderRadius.circular(25),
          ),
          child: AutoSizeText(
            backupMethod == WalletBackupMethod.Seed
                ? Provider.of<WalletState>(context).seed
                : backupMethod == WalletBackupMethod.SpendKey
                    ? Provider.of<WalletState>(context).spendKey
                    : backupMethod == WalletBackupMethod.ViewKey
                        ? Provider.of<WalletState>(context).viewKey
                        : "",
            textAlign: TextAlign.center,
            style: AppStyles.textStyleSeed(context),
            stepGranularity: 0.5,
          ),
        ),
      ],
    );
  }
}

// showing backup file and warning message
class BackupFileView extends StatelessWidget {
  final VoidCallback onChangeBackupMethodCallback;

  const BackupFileView(this.onChangeBackupMethodCallback);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AutoSizeText(
          "Your wallet file is encrypted using your password. You can restore your wallet on others device with this file.",
          textAlign: TextAlign.start,
          style: AppStyles.textStyleParagraph(context),
          stepGranularity: 0.5,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onChangeBackupMethodCallback();
          },
          child: Container(),
        ),
      ],
    );
  }
}
