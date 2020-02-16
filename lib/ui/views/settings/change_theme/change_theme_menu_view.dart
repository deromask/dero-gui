import 'package:dero/core/viewmodels/settings/change_theme/change_theme_menu_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ChangeThemeMenuView extends StatefulWidget {
  @override
  _ChangeThemeMenuViewState createState() => _ChangeThemeMenuViewState();
}

class _ChangeThemeMenuViewState extends State<ChangeThemeMenuView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ChangeThemeMenuModel>.withConsumer(
      viewModel: ChangeThemeMenuModel(),
      builder: (context, model, child) => Theme(
        data: ThemeData(
            dialogBackgroundColor: Provider.of<AppTheme>(context).background),
        child: Builder(
          builder: (context) {
            return SimpleDialog(
              title: Center(
                child: Text(
                  'Select Theme',
                  style: AppStyles.textStyleDialogHeader(context),
                ),
              ),
              children: model.themes.map((value) {
                return new SimpleDialogOption(
                  onPressed: () async {
                    await model.changeTheme(value);
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: new Text(
                      value,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'NunitoSans',
                        color: Provider.of<AppTheme>(context).primary60,
                      ),
                    ),
                  ), //item value
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
