part of 'settings_cubit.dart';

class SettingsState {
  SettingsState({
    this.language = Language.en,
    this.notifications = true,
    this.connectWhenVpnStarts = false,
    this.vpnProtocol = VpnProtocol.adaptive,
    this.connectionTimeout = ConnectionTimeout.s30,
    this.batterySaver = false,
    this.seamlessTunnel = true,
    this.pingConnection = false,
  });

  final Language language;
  final bool notifications;
  final bool connectWhenVpnStarts;
  final VpnProtocol vpnProtocol;
  final ConnectionTimeout connectionTimeout;
  final bool batterySaver;
  final bool seamlessTunnel;
  final bool pingConnection;

  SettingsState copyWith({
    Language? language,
    bool? notifications,
    bool? connectWhenVpnStarts,
    VpnProtocol? vpnProtocol,
    ConnectionTimeout? connectionTimeout,
    bool? batterySaver,
    bool? seamlessTunnel,
    bool? pingConnection,
  }) {
    return SettingsState(
      language: language ?? this.language,
      notifications: notifications ?? this.notifications,
      connectWhenVpnStarts: connectWhenVpnStarts ?? this.connectWhenVpnStarts,
      vpnProtocol: vpnProtocol ?? this.vpnProtocol,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout,
      batterySaver: batterySaver ?? this.batterySaver,
      // seamlessTunnel: seamlessTunnel ?? this.seamlessTunnel,
      seamlessTunnel: true,
      pingConnection: pingConnection ?? this.pingConnection,
    );
  }
}
