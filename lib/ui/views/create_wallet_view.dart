import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/create_wallet_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CreateWalletView extends StatefulWidget {
  @override
  _CreateWalletViewState createState() => _CreateWalletViewState();
}

class _CreateWalletViewState extends State<CreateWalletView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  TextEditingController _filenameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateWalletModel>.withConsumer(
      viewModel: CreateWalletModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<AppTheme>(context).background,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ModalProgressHUD(
            inAsyncCall: model.state == ViewState.Busy,
            child: SafeArea(
//                minimum: EdgeInsets.symmetric(
//                    vertical: MediaQuery.of(context).size.height * 0.035),
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
                                'CREATE WALLET',
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
                    child: FormBuilder(
                      // context,
                      key: _fbKey,
                      autovalidate: false,
                      // readonly: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                                  highlightColor: Colors.transparent),
                              child: FormBuilderTextField(
                                attribute: "filename",
                                controller: _filenameTextController,
                                style: AppStyles.textStyleParagraphPrimary(
                                    context),
                                textAlign: TextAlign.center,
                                cursorColor:
                                    Provider.of<AppTheme>(context).primary,
                                keyboardAppearance: Brightness.dark,
                                decoration: InputDecoration(
                                  hintText: "file name",
                                  prefixIcon: Icon(
                                    Icons.account_balance_wallet,
                                    color:
                                        Provider.of<AppTheme>(context).primary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.folder_open,
                                      color: Provider.of<AppTheme>(context)
                                          .primary,
                                    ),
                                    onPressed: () async {
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
//                                    if (hasPermission) {
//                                      try {
//                                        String filePath =
//                                            await FilePicker.getFilePath(
//                                                type: FileType.ANY);
//
//                                        setState(() {
//                                          _filenameTextController.text =
//                                              filePath;
//                                          _filenameTextController.value =
//                                              TextEditingValue(text: filePath);
//                                        });
//                                      } on Exception catch (e) {
//                                        print(e.toString());
//                                      }
//                                    }
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'NunitoSans',
                                    color:
                                        Provider.of<AppTheme>(context).text60,
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(100)
                                ],
                              ),
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
                                  highlightColor: Colors.transparent),
                              child: FormBuilderTextField(
                                attribute: "password",
                                obscureText: model.isPasswordHide,
                                maxLines: 1,
                                style: AppStyles.textStyleParagraphPrimary(
                                    context),
                                textAlign: TextAlign.center,
                                cursorColor:
                                    Provider.of<AppTheme>(context).primary,
                                keyboardAppearance: Brightness.dark,
                                decoration: InputDecoration(
                                  hintText: "password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color:
                                        Provider.of<AppTheme>(context).primary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      model.isPasswordHide
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Provider.of<AppTheme>(context)
                                          .primary,
                                    ),
                                    onPressed: () {
                                      model.showHidePassword();
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'NunitoSans',
                                    color:
                                        Provider.of<AppTheme>(context).text60,
                                  ),
                                ),
                                validators: [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(100)
                                ],
                                onFieldSubmitted: (String t) async {
                                  _fbKey.currentState.save();
                                  if (_fbKey.currentState.validate()) {
                                    var success = await model.createWallet(
                                        _fbKey.currentState.value['filename'],
                                        _fbKey.currentState.value['password']);
                                    if (success) {
                                      Navigator.pushNamed(context, '/home');
                                    }
                                  } else {
                                    print("validation failed");
                                  }
                                },
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
                    ), // end form
                  ),
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
                              'Create Wallet',
                              Dimens.BUTTON_TOP_DIMENS,
                              onPressed: () async {
                                _fbKey.currentState.save();
                                if (_fbKey.currentState.validate()) {
                                  var success = await model.createWallet(
                                      _fbKey.currentState.value['filename'],
                                      _fbKey.currentState.value['password']);
                                  if (success) {
                                    Navigator.pushNamed(context, '/home');
                                  }
                                } else {
                                  print("validation failed");
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
      ),
    );
  }
}
