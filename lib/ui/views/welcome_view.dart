import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/config.dart';
import 'package:dero/core/viewmodels/welcome_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/views/update_dialog.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

//    WidgetsBinding.instance.addPostFrameCallback((_) => showUpdate());

    return ViewModelProvider<WelcomeModel>.withConsumer(
      viewModel: WelcomeModel(),
      onModelReady: (model) async {
        bool isUptodate = await model.checkUpdate();

        if (isUptodate == false) {
          // show dialog
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => UpdateDialog(),
          );
        }
      },
      builder: (context, model, child) {
//        WidgetsBinding.instance
//            .addPostFrameCallback((_) => showUpdate(context, model));
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Provider.of<AppTheme>(context).background,
          body: SafeArea(
            minimum: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(10),
              top: ScreenUtil().setHeight(10),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //Container for the animation
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(30),
                        ),
                        //Width/Height ratio for the animation is needed because BoxFit is not working as expected
//                    width: MediaQuery.of(context).size.width * 5 / 9,
//                    height: MediaQuery.of(context).size.width * 5 / 9,
                        width: ScreenUtil().setHeight(250),
                        height: ScreenUtil().setWidth(250),
                        child:
                            Image.asset("assets/images/logo_no_background.png"),
                      ),
                      //Container for the paragraph
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(50)),
                        child: AutoSizeText(
                          "Welcome to DeroMask. To begin you may create a new wallet or import an existing one.",
                          style: AppStyles.textStyleParagraph(context),
                          maxLines: 4,
                          stepGranularity: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          "OPEN WALLET",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/open-wallet');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          "RECOVER WALLET",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/recover-wallet-import-seed');
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          "CREATE NEW WALLET",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/create-wallet');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//  void showUpdate(BuildContext context, model) async {
//    print("show update");
//
////    bool isUptodate = await model.checkUpdate();
////    print("is up to date: " + isUptodate.toString());
////    if (isUptodate == false) {
////      // show dialog
////      showDialog(
////        barrierDismissible: true,
////        context: context,
////        builder: (context) =>
////            SuccessDialogWidget("New version of DeroMask is available"),
////      );
////    }
//  }
}
