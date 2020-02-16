import 'package:dero/core/config.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/receive/receive_sheet_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/ui/widgets/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class ReceiveSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return ViewModelProvider<ReceiveSheetModel>.withConsumer(
      viewModel: ReceiveSheetModel(),
      onModelReady: (model) => {},
      builder: (context, model, child) => Container(
        child: SafeArea(
          minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.035),
          child: Column(
            children: <Widget>[
              // A row for the address text and close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Empty SizedBox
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  //Container for the address text and sheet handle
                  Column(
                    children: <Widget>[
                      // Sheet handle
                      Container(
                        margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                        height: 5,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Provider.of<AppTheme>(context).text10,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(15.0)),
                        child: locator.get<UIUtil>().fourLineAddressText(
                            context, Provider.of<WalletState>(context).address,
                            type: FourLineAddressTextType.PRIMARY60),
                      ),
                    ],
                  ),
                  //Empty SizedBox
                  SizedBox(
                    width: ScreenUtil().setHeight(60),
                    height: ScreenUtil().setWidth(60),
                  ),
                ],
              ),

              //QR which takes all the available space left from the buttons & address text
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(15),
                          bottom: ScreenUtil().setHeight(15),
                        ),
                        // todo responsive
                        width: ScreenUtil().setHeight(400),
                        child: QrImage(
                          data: Provider.of<WalletState>(context).address,
                          version: 5,
//                                size: 200.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //A column with Copy Address and Share Address buttons
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CopyButtonView("Copy Address",
                          Provider.of<WalletState>(context).address)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      AppButton.buildAppButton(
                        context,
                        // Share Address Button
                        AppButtonType.PRIMARY_OUTLINE,
                        'Share Address',
                        Dimens.BUTTON_TOP_DIMENS,
                        onPressed: () {
                          print("share tapped");
                          Share.share(
                              Provider.of<WalletState>(context, listen: false)
                                  .address);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
