import 'dart:async';

import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/themes.dart';

class ThemeService {
  final AppSettingsService _appSettingsService = locator<AppSettingsService>();

  StreamController<AppTheme> themeController =
      new StreamController<AppTheme>.broadcast();

  Stream<AppTheme> get theme => themeController.stream;

  static AppTheme getDefault() {
    return KaliumTheme();
  }

  static AppTheme nameToTheme(String name) {
    switch (name) {
      case "Kalium":
        {
          return KaliumTheme();
        }
        break;

      case "Titanium":
        {
          return TitaniumTheme();
        }

        break;

      case "Iridium":
        {
          return IridiumTheme();
        }

        break;

      case "Beryllium":
        {
          return BerylliumTheme();
        }

        break;

      case "Radium":
        {
          return RadiumTheme();
        }

        break;

      default:
        {
          return null;
        }
        break;
    }
  }

  AppTheme getSavedOrDefault() {
    String saved = _appSettingsService.getTheme();
    if (saved == null || saved == "") {
      return getDefault();
    } else {
      return nameToTheme(saved);
    }
  }

  init() async {
    AppTheme theme = getSavedOrDefault();
    await changeTheme(theme.name);
  }

  Future changeTheme(String name) async {
    AppTheme theme = nameToTheme(name);

    if (theme != null) {
      themeController.add(theme);
      _appSettingsService.setTheme(theme.name);
    }
  }
}
