import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/config.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/open_wallet_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:share_extend/share_extend.dart';

class OpenWalletView extends StatefulWidget {
  @override
  _OpenWalletViewState createState() => _OpenWalletViewState();
}

class _OpenWalletViewState extends State<OpenWalletView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

//  final TextEditingController _filenameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return ViewModelProvider<OpenWalletModel>.withConsumer(
      viewModel: OpenWalletModel(),
      onModelReady: (model) {
        model.getWallets();
      },
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
                                'OPEN WALLET',
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
                          AutoSizeText(
                            "Select wallet",
                            textAlign: TextAlign.left,
                            style: AppStyles.textStyleParagraph(context),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(30),
                              right: ScreenUtil().setWidth(30),
                              top: ScreenUtil().setHeight(10),
                            ),
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
                                child: FormBuilderDropdown(
                                  attribute: "filename",
                                  isExpanded: false,
                                  isDense: true,
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  readOnly:
                                      model.wallets == null ? true : false,
                                  style: AppStyles.textStyleParagraphPrimary(
                                      context),
                                  decoration: InputDecoration(
                                    hintText: "file name",
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.file_download,
                                        color: Provider.of<AppTheme>(context)
                                            .primary,
                                      ),
                                      onPressed: () async {
                                        _fbKey.currentState.save();
                                        String filename = _fbKey
                                            .currentState.value['filename'];

                                        if (filename != null &&
                                            filename != "") {
                                          String filepath =
                                              await getWalletFilepath(filename);
                                          ShareExtend.share(filepath, "file");
                                        } // @todo show popup notice user to select wallet first
                                      },
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.folder_open,
                                        color: Provider.of<AppTheme>(context)
                                            .primary,
                                      ),
                                      onPressed: () async {
                                        await model.importWalletFile2();
                                      },
                                    ),
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
                                  items: model.wallets == null ||
                                          model.wallets?.length == 0
                                      ? []
                                      : model.wallets
                                          .map(
                                            (filename) => DropdownMenuItem(
                                              value: filename,
                                              child: Text(
                                                filename,
//                                                  textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0,
                                                  color: Provider.of<AppTheme>(
                                                          context)
                                                      .text,
                                                  fontFamily: 'NunitoSans',
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ),
                          // password field
                          Container(
                            margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(30),
                              right: ScreenUtil().setWidth(30),
                              top: ScreenUtil().setHeight(10),
                            ),
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
                                textInputAction: TextInputAction.done,
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
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'NunitoSans',
                                    color:
                                        Provider.of<AppTheme>(context).text60,
                                  ),
                                  border: InputBorder.none,
                                ),
                                validators: [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(100)
                                ],
                                onFieldSubmitted: (String t) async {
                                  _fbKey.currentState.save();
                                  if (_fbKey.currentState.validate()) {
                                    var success = await model.openWallet(
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
                          // start error message
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
                                ), // end error message
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
                              'Open Wallet',
                              Dimens.BUTTON_TOP_DIMENS,
                              onPressed: () async {
                                _fbKey.currentState.save();
//                                  print(_fbKey.currentState.value);
                                if (_fbKey.currentState.validate()) {
                                  var success = await model.openWallet(
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
//                                Navigator.of(context).pushNamedAndRemoveUntil(
//                                    '/welcome',
//                                    (Route<dynamic> route) => false);
//                                Navigator.popUntil(
//                                    context, ModalRoute.withName('/welcome'));
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).maybePop();
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/welcome',
                                      (Route<dynamic> route) => false);
                                }
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
