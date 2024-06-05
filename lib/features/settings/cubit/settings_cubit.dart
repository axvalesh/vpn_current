import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/enums.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  late final SharedPreferences prefs;

  void _updateSettings(SettingsState updatedState) {
    emit(updatedState);
  }

  _init() async => prefs = await SharedPreferences.getInstance();

  loadSettings() async {
    await _init();
    String language = prefs.getString('language') ?? Language.en.name;
    bool notifications = prefs.getBool('notifications') ?? true;
    bool connectWhenStarts = prefs.getBool('connectWhenVpnStarts') ?? false;
    String vpnProtocol =
        prefs.getString('protocol') ?? VpnProtocol.adaptive.name;
    String connectionTimeout =
        prefs.getString('timeout') ?? ConnectionTimeout.continuously.name;
    bool batterySaver = prefs.getBool('batterySaver') ?? false;
    bool seamlessTunnel = prefs.getBool('seamlessTunnel') ?? false;
    bool pingConnection = prefs.getBool('pingConnection') ?? false;

    emit(state.copyWith(
      language: Language.values.firstWhere((value) => value.name == language),
      notifications: notifications,
      connectWhenVpnStarts: connectWhenStarts,
      vpnProtocol: VpnProtocol.values.firstWhere(
        (value) => value.name == vpnProtocol,
      ),
      connectionTimeout: ConnectionTimeout.values.firstWhere(
        (value) => value.name == connectionTimeout,
      ),
      batterySaver: batterySaver,
      seamlessTunnel: seamlessTunnel,
      pingConnection: pingConnection,
    ));
  }

  changeLanguage(Language language) {
    prefs.setString('language', language.name);
    emit(state.copyWith(language: language));
  }

  toggleNotifications(bool enabled) {
    prefs.setBool('notifications', enabled);
    _updateSettings(state.copyWith(notifications: enabled));
  }

  toggleConnectWhenVpnStarts(bool connect) {
    prefs.setBool('connectWhenVpnStarts', connect);
    _updateSettings(state.copyWith(connectWhenVpnStarts: connect));
  }

  changeVpnProtocol(VpnProtocol option) {
    prefs.setString('protocol', option.name);
    _updateSettings(state.copyWith(vpnProtocol: option));
  }

  changeConnectionTimeout(ConnectionTimeout option) {
    prefs.setString('timeout', option.name);
    _updateSettings(state.copyWith(connectionTimeout: option));
  }

  toggleBatterySaver(bool enabled) {
    prefs.setBool('batterySaver', enabled);
    _updateSettings(state.copyWith(batterySaver: enabled));
  }

  toggleSeamlessTunnel(bool enabled) {
    prefs.setBool('seamlessTunnel', enabled);
    _updateSettings(state.copyWith(seamlessTunnel: enabled));
  }

  togglePingConnection(bool enabled) {
    prefs.setBool('pingConnection', enabled);
    _updateSettings(state.copyWith(pingConnection: enabled));
  }
}
