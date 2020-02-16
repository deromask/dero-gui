import 'package:dero/core/services/app_update_service.dart';
import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/core/services/contacts_service.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/services/theme_service.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/create_wallet_model.dart';
import 'package:dero/core/viewmodels/home/account_detail_model.dart';
import 'package:dero/core/viewmodels/home/home_model.dart';
import 'package:dero/core/viewmodels/open_wallet_model.dart';
import 'package:dero/core/viewmodels/receive/receive_sheet_model.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_import_seed_model.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_set_password_model.dart';
import 'package:dero/core/viewmodels/recover/recover_wallet_set_topoheight_model.dart';
import 'package:dero/core/viewmodels/send/send_address_sheet_model.dart';
import 'package:dero/core/viewmodels/send/send_amount_sheet_model.dart';
import 'package:dero/core/viewmodels/send/send_confirm_sheet_model.dart';
import 'package:dero/core/viewmodels/settings/backup_seed/backup_seed_sheet_model.dart';
import 'package:dero/core/viewmodels/settings/change_daemon/change_daemon_sheet_model.dart';
import 'package:dero/core/viewmodels/settings/change_password/change_password_dialog_model.dart';
import 'package:dero/core/viewmodels/settings/change_theme/change_theme_menu_model.dart';
import 'package:dero/core/viewmodels/settings/change_wallet_name/change_wallet_name_dialog_model.dart';
import 'package:dero/core/viewmodels/settings/contacts/add_contact_model.dart';
import 'package:dero/core/viewmodels/settings/contacts/contact_details_model.dart';
import 'package:dero/core/viewmodels/settings/contacts/contact_list_model.dart';
import 'package:dero/core/viewmodels/settings/delete_wallet/delete_wallet_confirm_dialog_model.dart';
import 'package:dero/core/viewmodels/settings/rescan_blockchain/rescan_confirm_dialog_model.dart';
import 'package:dero/core/viewmodels/settings/settings_drawer_model.dart';
import 'package:dero/core/viewmodels/splash_model.dart';
import 'package:dero/core/viewmodels/welcome_model.dart';
import 'package:dero/ui/util/ui_util.dart';
import 'package:dero/ui/widgets/confirm_password_dialog.dart';
import 'package:dero/ui/widgets/copy_button.dart';
import 'package:dero/ui/widgets/password_field_view.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

/// todo setup service only, move initialization to splash screen
Future setupLocator() async {
//  WidgetsFlutterBinding.ensureInitialized();

  var appsettingsServiceInstance = await AppSettingsService.getInstance();
  locator.registerSingleton<AppSettingsService>(appsettingsServiceInstance);

  var contactsServiceInstance = await ContactsService.getInstance();
  locator.registerSingleton<ContactsService>(contactsServiceInstance);

  var appUpdateService = AppUpdateService.getInstance();
  locator.registerSingleton<AppUpdateService>(appUpdateService);

  locator.registerLazySingleton(() => DeroCore());
  locator.registerLazySingleton(() => WalletService());

  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => UIUtil());

  locator.registerFactory(() => SettingsDrawerModel());
  locator.registerFactory(() => SendAddressSheetModel());
  locator.registerFactory(() => SendAmountSheetModel());
  locator.registerFactory(() => SendConfirmSheetModel());
  locator.registerFactory(() => ReceiveSheetModel());
  locator.registerFactory(() => SplashModel());
  locator.registerFactory(() => OpenWalletModel());
  locator.registerFactory(() => CreateWalletModel());
  locator.registerFactory(() => RecoverWalletImportSeedModel());
  locator.registerFactory(() => RecoverWalletSetPasswordModel());
  locator.registerFactory(() => RecoverWalletSetTopoheightModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CopyButtonModel());
  locator.registerFactory(() => BackupSeedSheetModel());
  locator.registerFactory(() => RescanConfirmDialogModel());
  locator.registerFactory(() => ChangeDaemonSheetModel());
  locator.registerFactory(() => ContactListModel());
  locator.registerFactory(() => AddContactModel());
  locator.registerFactory(() => ContactDetailsModel());
  locator.registerFactory(() => DeleteWalletConfirmDialogModel());
  locator.registerFactory(() => ChangePasswordDialogModel());
  locator.registerFactory(() => ChangeThemeMenuModel());
  locator.registerFactory(() => ChangeWalletNameDialogModel());
  locator.registerFactory(() => ConfirmPasswordDialogModel());
  locator.registerFactory(() => AccountDetailSheetModel());
  locator.registerFactory(() => PasswordFieldModel());
  locator.registerFactory(() => WelcomeModel());
}
