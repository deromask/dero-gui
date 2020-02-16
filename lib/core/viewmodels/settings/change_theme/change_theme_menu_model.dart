import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/theme_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class ChangeThemeMenuModel extends BaseModel {
  final ThemeService _themeService = locator<ThemeService>();

  List<String> themes = [
    "Kalium",
    "Titanium",
    "Iridium",
    "Beryllium",
    "Radium"
  ];

  Future changeTheme(String theme) async {
    setState(ViewState.Busy);
    await _themeService.changeTheme(theme);
    setState(ViewState.Idle);
  }
}
