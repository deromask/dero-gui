import 'package:dero/core/services/contacts_service.dart';
import 'package:dero/locator.dart';
import 'package:dero/ui/views/create_wallet_view.dart';
import 'package:dero/ui/views/dapps/dapps_view.dart';
import 'package:dero/ui/views/home/home_view.dart';
import 'package:dero/ui/views/open_wallet_view.dart';
import 'package:dero/ui/views/recover/recover_wallet_import_seed.dart';
import 'package:dero/ui/views/recover/recover_wallet_set_password.dart';
import 'package:dero/ui/views/recover/recover_wallet_set_topoheight.dart';
import 'package:dero/ui/views/recover/set_password_arguments.dart';
import 'package:dero/ui/views/recover/set_topoheight_arguments.dart';
import 'package:dero/ui/views/settings/contacts/contacts_list.dart';
import 'package:dero/ui/views/splash_view.dart';
import 'package:dero/ui/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const String initialRoute = "/";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomeView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/create-wallet':
        return MaterialPageRoute(builder: (_) => CreateWalletView());
      case '/open-wallet':
        return MaterialPageRoute(builder: (_) => OpenWalletView());
      case '/recover-wallet-import-seed':
        return MaterialPageRoute(builder: (_) => RecoverWalletImportSeedView());
      case '/recover-wallet-set-password':
        final SetPasswordArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => RecoverWalletSetPasswordView(
              args.walletRecoverMethod, args.recoverData),
        );
      case '/recover-wallet-set-topoheight':
        final SetTopoheightArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => RecoverWalletSetTopoheightView(
              args.walletRecoverMethod,
              args.recoverData,
              args.filename,
              args.password),
        );
      case '/contacts':
        return MaterialPageRoute(
          builder: (_) => StreamProvider.value(
            value: locator<ContactsService>().contactsController.stream,
            initialData: locator<ContactsService>()
                .currentContacts
                .contacts, // contacts was already initialized in setuplocator phase
//          builder: (context) => locator<ContactsService>().contactsController,
            updateShouldNotify: (prev, next) {
              print(prev.length);
              print(next.length);
              return true;
            },
            child: ContactsList(),
          ),
        );
      case '/dapps':
        return MaterialPageRoute(builder: (_) => DappsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
