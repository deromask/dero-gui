import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/core/models/contacts.pb.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/settings/contacts/contact_details_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/send/send_address_sheet_view.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ContactDetailsSheetView extends StatefulWidget {
  final Contact contact;

  ContactDetailsSheetView(this.contact);

  @override
  _ContactDetailsSheetViewState createState() =>
      _ContactDetailsSheetViewState();
}

class _ContactDetailsSheetViewState extends State<ContactDetailsSheetView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ViewModelProvider<ContactDetailsModel>.withConsumer(
      viewModel: ContactDetailsModel(),
      builder: (context, model, child) => SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Trashcan Button
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsetsDirectional.only(top: 10.0, start: 10.0),
                  child: FlatButton(
                    highlightColor: Provider.of<AppTheme>(context).text15,
                    splashColor: Provider.of<AppTheme>(context).text15,
                    onPressed: () {
                      // delete contacts
                      model.removeContact(widget.contact);
                      Navigator.of(context).pop();
                    },
                    child: Icon(AppIcons.trashcan,
                        size: 24, color: Provider.of<AppTheme>(context).text),
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
                // The header of the sheet
                Container(
                  margin: EdgeInsets.only(
                      top: 25.0,
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 140),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        "CONTACT",
                        style: AppStyles.textStyleHeader(context),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        stepGranularity: 0.1,
                      ),
                    ],
                  ),
                ),
//               Search Button
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsetsDirectional.only(top: 10.0, end: 10.0),
                  child: FlatButton(
                    highlightColor: Provider.of<AppTheme>(context).text15,
                    splashColor: Provider.of<AppTheme>(context).text15,
                    onPressed: () {},
                    child: Icon(Icons.edit,
                        size: 24, color: Provider.of<AppTheme>(context).text),
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
              ],
            ),

            // The main container that holds monKey, Contact Name and Contact Address
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // avatar
//                Expanded(
//                  child: SizedBox(),
//                ),
                  // Contact Name container
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.105,
                      right: MediaQuery.of(context).size.width * 0.105,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Provider.of<AppTheme>(context).backgroundDarkest,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      widget.contact.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Provider.of<AppTheme>(context).primary,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ),
                  // Contact Address
                  GestureDetector(
                    onTap: () {
//                    Clipboard.setData(new ClipboardData(text: contact.address));
//                    setState(() {
//                      _addressCopied = true;
//                    });
//                    if (_addressCopiedTimer != null) {
//                      _addressCopiedTimer.cancel();
//                    }
//                    _addressCopiedTimer =
//                        new Timer(const Duration(milliseconds: 800), () {
//                      setState(() {
//                        _addressCopied = false;
//                      });
//                    });
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.105,
                          right: MediaQuery.of(context).size.width * 0.105,
                          top: 15),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Provider.of<AppTheme>(context).backgroundDarkest,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: locator.get<UIUtil>().fourLineAddressText(
                            context,
                            widget.contact.address,
                          ),
                    ),
                  ),
//                // Address Copied text container
//                Container(
//                  margin: EdgeInsets.only(top: 5, bottom: 5),
//                  child: Text(
//                      _addressCopied
//                          ? AppLocalization.of(context).addressCopied
//                          : "",
//                      style: TextStyle(
//                        fontSize: 14.0,
//                        color: Provider.of<AppTheme>(context).success,
//                        fontFamily: 'NunitoSans',
//                        fontWeight: FontWeight.w600,
//                      )),
//                ),
                ],
              ),
            ),

            // A column with "Send" and "Close" buttons
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.025),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // Send Button
                      AppButton.buildAppButton(context, AppButtonType.PRIMARY,
                          "Send", Dimens.BUTTON_TOP_DIMENS,
                          disabled: Provider.of<WalletState>(context).balance ==
                                  null ||
                              Provider.of<WalletState>(context).balance <= 0,
                          onPressed: () {
                        Navigator.of(context).pop();
                        // show send sheet
                        showModalBottomSheetCustom(
                          context: context,
                          color: Provider.of<AppTheme>(context).background,
                          radius: 20.0,
                          maxHeightFactor: 15 / 16,
                          builder: (BuildContext context) {
                            return SendAddressSheetView(widget.contact.address);
                          },
                        );
                      }),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Close Button
                      AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY_OUTLINE,
                          "Close",
                          Dimens.BUTTON_BOTTOM_DIMENS, onPressed: () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
