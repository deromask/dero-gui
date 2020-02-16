import 'package:dero/core/models/appsettings.pb.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/core/services/theme_service.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/router.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // wait for appstate
  await setupLocator();

  /// todo move these initialization to splash screen
//  await locator<WalletService>().initDemo();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provide global data resolve by service to UI
    return MultiProvider(
      providers: [
        // todo expose contact service here make it not reactive, need more investigation
//        StreamProvider.value(
//          value: locator<ContactsService>().contactsController.stream,
//          initialData: locator<ContactsService>()
//              .currentContacts
//              .contacts, // contacts was already initialized in setuplocator phase
////          builder: (context) => locator<ContactsService>().contactsController,
//          updateShouldNotify: (prev, next) {
//            print(prev.length);
//            print(next.length);
//            return true;
//          },
//        ),
        StreamProvider<AppSettings>.value(
          initialData: locator<AppSettingsService>()
              .currentAppSettings, // appsettings was already initialized in setuplocator phase
          value: locator<AppSettingsService>().appStateController.stream,
//          builder: (context) =>
//              locator<AppSettingsService>().appStateController,
        ),
        StreamProvider<AppTheme>.value(
          initialData: locator<ThemeService>().getSavedOrDefault(),
          value: locator<ThemeService>().themeController.stream,
//          builder: (context) => locator<ThemeService>().themeController,
        ),
        StreamProvider<WalletState>.value(
          initialData: WalletState(), // init with all empty value
          value: locator<WalletService>().walletStateController.stream,
//          builder: (context) => locator<WalletService>().walletStateController,
        ),
      ],
      child: MaterialApp(
        title: 'DeroMask',
        theme: ThemeData(),
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
