import 'package:dero/core/models/contacts.pb.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/views/settings/contacts/add_contact.dart';
import 'package:dero/ui/views/settings/contacts/contact_details.dart';
import 'package:dero/ui/widgets/bottom_sheet_custom.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsList extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = Provider.of<List<Contact>>(context);

    return Scaffold(
      backgroundColor: Provider.of<AppTheme>(context).backgroundDark,
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        backgroundColor: Provider.of<AppTheme>(context).background40,
        title: new Text('Contacts: ' +
            Provider.of<List<Contact>>(context).length.toString()),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
//              leading: new Container(),
      ),
//        drawer: SizedBox(
//          width: MediaQuery.of(context).size.width * 0.85,
//          child: Drawer(
//            child: SettingsDrawerView(),
//          ),
//        ),
      body: SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.035),
        child: Container(
          decoration: BoxDecoration(
            color: Provider.of<AppTheme>(context).backgroundDark,
            boxShadow: [
              BoxShadow(
                  color: Provider.of<AppTheme>(context).overlay30,
                  offset: Offset(-5, 0),
                  blurRadius: 20),
            ],
          ),
          child: Column(
            children: <Widget>[
              // Contacts list + top and bottom gradients
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Contacts list
                    ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
//                              return Slidable(
//                                key: ValueKey(index),
//                                actionPane: SlidableDrawerActionPane(),
//                                actions: <Widget>[
//                                  IconSlideAction(
//                                    caption: 'Send',
//                                    color: Colors.indigo,
//                                    icon: Icons.share,
//                                  ),
//                                ],
//                                secondaryActions: <Widget>[
//                                  IconSlideAction(
//                                    caption: 'Delete',
//                                    color: Colors.red,
//                                    icon: Icons.delete,
//                                    onTap: () {},
//                                  ),
//                                ],
//                                dismissal: SlidableDismissal(
//                                  child: SlidableDrawerDismissal(),
//                                ),
//                                child: ListTile(
//                                  title: _buildSingleContact(
//                                      context,
//                                      Provider.of<Contacts>(context)
//                                          .contacts[index]),
//                                ),
//                              );
                        // Build contact
                        return _buildSingleContact(
                          context,
                          contacts[index],
                        );
                      },
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
                              Provider.of<AppTheme>(context).backgroundDark,
                              Provider.of<AppTheme>(context).backgroundDark00
                            ],
                            begin: AlignmentDirectional(0.5, -1.0),
                            end: AlignmentDirectional(0.5, 1.0),
                          ),
                        ),
                      ),
                    ),
                    //List Bottom Gradient End
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 15.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Provider.of<AppTheme>(context).backgroundDark00,
                              Provider.of<AppTheme>(context).backgroundDark,
                            ],
                            begin: AlignmentDirectional(0.5, -1.0),
                            end: AlignmentDirectional(0.5, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    AppButton.buildAppButton(
                      context,
                      AppButtonType.TEXT_OUTLINE,
                      "Add Contact",
                      Dimens.BUTTON_BOTTOM_DIMENS,
                      onPressed: () {
                        showModalBottomSheetCustom(
                          context: context,
                          color: Provider.of<AppTheme>(context, listen: false)
                              .background,
                          radius: 20.0,
                          maxHeightFactor: 15 / 16,
                          builder: (BuildContext context) =>
                              ContactsSheetView(),
                        );
                      },
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

  Widget _buildSingleContact(BuildContext context, Contact contact) {
    return new FlatButton(
      highlightColor: Provider.of<AppTheme>(context).text15,
      splashColor: Provider.of<AppTheme>(context).text15,
      onPressed: () {
//        ContactDetailsSheet(contact, documentsDirectory)
//            .mainBottomSheet(context);
        showModalBottomSheetCustom(
          context: context,
          color: Provider.of<AppTheme>(context, listen: false).background,
          radius: 20.0,
          maxHeightFactor: 15 / 16,
          builder: (BuildContext context) {
            return ContactDetailsSheetView(contact);
          },
        );
      },
      padding: EdgeInsets.all(0.0),
      child: Column(children: <Widget>[
        Divider(
          height: 2,
          color: Provider.of<AppTheme>(context).text15,
        ),
        // Main Container
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          margin: new EdgeInsetsDirectional.only(start: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // avatar
              Container(
                width: smallScreen(context) ? 55 : 70,
                height: smallScreen(context) ? 55 : 70,
                child: Icon(
                  Icons.account_circle,
                  size: smallScreen(context) ? 50 : 60,
                  color: Provider.of<AppTheme>(context).primary,
                ),
              ),
              //Contact info
              Container(
                margin: EdgeInsetsDirectional.only(start: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Contact name
                    Text(contact.name,
                        style: AppStyles.textStyleSettingItemHeader(context)),
                    //Contact address
                    Text(
                      UIUtil.middleTrimmedText(contact.address,
                          start: 6, subend: 8),
                      style: AppStyles.textStyleTransactionAddress(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
