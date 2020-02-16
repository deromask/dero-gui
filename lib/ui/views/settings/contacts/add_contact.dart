import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/settings/contacts/add_contact_model.dart';
import 'package:dero/ui/app_icons.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ContactsSheetView extends StatefulWidget {
  @override
  _ContactsSheetViewState createState() => _ContactsSheetViewState();
}

class _ContactsSheetViewState extends State<ContactsSheetView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  TextEditingController _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AddContactModel>.withConsumer(
      viewModel: AddContactModel(),
      builder: (context, model, child) => SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              // Top row of the sheet which contains the header and the scan qr button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Empty SizedBox
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  // The header of the sheet
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 140),
                    child: Column(
                      children: <Widget>[
                        AutoSizeText(
                          "Add Contact",
                          style: AppStyles.textStyleHeader(context),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          stepGranularity: 0.1,
                        ),
                      ],
                    ),
                  ),
                  // Empty sized box
                  SizedBox(width: 60, height: 60)
                ],
              ),

              // The main container that holds "Enter Name" and "Enter Address" text fields
              Expanded(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Clear focus of our fields when tapped in this empty space
                        FocusScope.of(context).unfocus();
                        _nameFocusNode.unfocus();
                        _addressFocusNode.unfocus();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: SizedBox.expand(),
                        constraints: BoxConstraints.expand(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.14),
                      child: FormBuilder(
                        key: _fbKey,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent),
                          child: Column(
                            children: <Widget>[
                              // Enter Name Container
                              Container(
                                margin: EdgeInsets.only(
                                    left: smallScreen(context) ? 20 : 30,
                                    right: smallScreen(context) ? 20 : 30,
                                    top: 20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Provider.of<AppTheme>(context)
                                      .backgroundDarkest,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // Enter Name text field
                                child: FormBuilderTextField(
//                                inputFormatters: [
//                                  WhitelistingTextInputFormatter.digitsOnly
//                                ],
                                  attribute: "name",
//                                  controller: _amountTextController,
//                                  keyboardType: TextInputType.numberWithOptions(
//                                      decimal: true),
                                  focusNode: _nameFocusNode,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  style: AppStyles.textStyleParagraphPrimary(
                                      context),
                                  textAlign: TextAlign.center,
                                  cursorColor:
                                      Provider.of<AppTheme>(context).primary,
                                  keyboardAppearance: Brightness.dark,
                                  decoration: InputDecoration(
                                    hintText: "Enter a Name @",
//                                    prefixIcon: Icon(Icons.swap_vert),
//                                    suffixIcon: IconButton(
//                                      icon: Icon(Icons.content_paste),
//                                      onPressed: () async {},
//                                    ),
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
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                                height: 20,
                              ),
                              // Enter Address container
                              Container(
                                margin: EdgeInsets.only(
                                    left: smallScreen(context) ? 20 : 30,
                                    right: smallScreen(context) ? 20 : 30,
                                    top: 20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Provider.of<AppTheme>(context)
                                      .backgroundDarkest,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // Enter Address text field
                                child: FormBuilderTextField(
                                  attribute: "address",
                                  maxLines: null,
                                  controller: _addressTextController,
                                  focusNode: _addressFocusNode,
                                  enabled: model.state != ViewState.Busy,
                                  onChanged: (text) {
                                    model.clearErrorMessages();
                                  },
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  style: AppStyles.textStyleParagraphPrimary(
                                      context),
                                  textAlign: TextAlign.center,
                                  cursorColor:
                                      Provider.of<AppTheme>(context).primary,
                                  keyboardAppearance: Brightness.dark,
                                  decoration: InputDecoration(
                                    hintText: "Enter address",
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        AppIcons.scan,
                                        size: 20,
                                        color: Provider.of<AppTheme>(context)
                                            .primary,
                                      ),
                                      onPressed: () async {
                                        try {
                                          String result =
                                              await BarcodeScanner.scan();
                                          _addressTextController.text = result;
                                          _addressTextController.value =
                                              TextEditingValue(text: result);
                                        } on Exception catch (e) {
                                          print(e.toString());
                                        }
                                      },
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(AppIcons.paste,
                                          size: 20,
                                          color: Provider.of<AppTheme>(context)
                                              .primary),
                                      onPressed: () async {
                                        ClipboardData data =
                                            await Clipboard.getData(
                                                'text/plain');
                                        // fix textselection bugs
                                        // https://github.com/flutter/flutter/issues/35848
                                        FocusScope.of(context).unfocus();
                                        _addressTextController.text = data.text;
                                        _addressTextController.value =
                                            TextEditingValue(text: data.text);
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
                                    FormBuilderValidators.maxLength(150)
                                  ],
                                ),
                              ),
                              model.errorMessage == null ||
                                      model.errorMessage == ""
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        model.errorMessage,
                                        textAlign: TextAlign.center,
                                        style: AppStyles.textStyleErrorMedium(
                                            context),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //A column with "Add Contact" and "Close" buttons
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // Add Contact Button
                        AppButton.buildAppButton(
                          context,
                          AppButtonType.PRIMARY,
                          "Add Contact",
                          Dimens.BUTTON_TOP_DIMENS,
                          onPressed: () async {
                            print("add contact");
                            _fbKey.currentState.save();
                            if (_fbKey.currentState.validate()) {
                              print("form valid");
                              bool success = await model.addContact(
                                  _fbKey.currentState.value['name'],
                                  _fbKey.currentState.value['address']);
                              if (success) {
                                Navigator.of(context).pop();
                              }
                            } else {
                              print("form invalid");
                            }
                          },
                        ),
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
      ),
    );
  }
}
