import 'package:dero/core/config.dart' show DEFAULT_REMOTE_DAEMON;
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class ChangeDaemonSheetModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  final AppSettingsService _appStateService = locator<AppSettingsService>();

  String _selectedDaemon;
  String get selectedDaemon => _selectedDaemon;

  List<String> _daemons = [DEFAULT_REMOTE_DAEMON, "127.0.0.1:20206"];
  List<String> get daemons => _daemons;

  String errorMessage;

  setSelectedDaemon(String s) {
    _selectedDaemon = s;
    // add this daemon address to the list in case it's not already
    if (!_daemons.contains(_selectedDaemon)) {
      _daemons.add(_selectedDaemon);
    }
    notifyListeners();
  }

  Future<bool> changeDaemon(String address) async {
    setState(ViewState.Busy);

    String _daemon;

    if (address == null && address == "") {
      // use selected daemon
      _daemon = _selectedDaemon;
    } else {
      // use custom daemon
      _daemon = address;
    }

    try {
      _appStateService.setDaemonAddress(_daemon);
      await _deroCore.setDaemonAddress(_daemon);
    } on Exception catch (e) {
      errorMessage = e.toString();
    }

    setState(ViewState.Idle);

    return errorMessage == null || errorMessage == "";
  }
}
