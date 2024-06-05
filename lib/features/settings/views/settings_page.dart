import 'package:defer_pointer/defer_pointer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/account.dart';
import 'package:sebek_vpn/features/settings/settings.dart';
import 'package:sebek_vpn/features/vpn/views/connect_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String route = '/vpn/settings';

  void _toggleNotifications(BuildContext context, bool enabled) {
    context.read<SettingsCubit>().toggleNotifications(enabled);
    apiHandler.changeSettings(enabled);
  }

  void _toggleConnectWhenVpnStarts(BuildContext context, bool connect) {
    context.read<SettingsCubit>().toggleConnectWhenVpnStarts(connect);
  }

  void _changeVpnProtocol(BuildContext context, VpnProtocol option) {
    context.read<SettingsCubit>().changeVpnProtocol(option);
  }

  void _changeConnectionTimeout(
      BuildContext context, ConnectionTimeout option) {
    context.read<SettingsCubit>().changeConnectionTimeout(option);
  }

  void _toggleBatterySaver(BuildContext context, bool enabled) {
    context.read<SettingsCubit>().toggleBatterySaver(enabled);
  }

  void _toggleSeamlessTunnel(BuildContext context, bool enabled) {
    context.read<SettingsCubit>().toggleSeamlessTunnel(enabled);
  }

  void _togglePingConnection(BuildContext context, bool enabled) {
    context.read<SettingsCubit>().togglePingConnection(enabled);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, ConnectPage.route);
        return false;
      },
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, accountState) {
          if (accountState is! AccountAuthorized) {
            return SizedBox();
          }
          return BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  leading: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, ConnectPage.route),
                    child: SvgPicture.asset('assets/images/back_arrow.svg'),
                  ),
                  title: Text(
                    LocaleKeys.settings_page_title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ).tr(),
                ),
                body: SingleChildScrollView(
                  child: DeferredPointerHandler(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16, left: 32, right: 32),
                          child: Text(
                            LocaleKeys.settings_page_language_label,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: SebekColors.tertiary,
                            ),
                          ).tr(),
                        ),
                        const LanguageDropdown(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 4),
                        ),
                        SwitchRow(
                          enabled: state.notifications,
                          onToggle: (enabled) =>
                              _toggleNotifications(context, enabled!),
                          margin:
                              const EdgeInsets.only(top: 32, left: 32, right: 32),
                          label: LocaleKeys.settings_page_notification.tr(),
                        ),
                        SwitchRow(
                          enabled: state.connectWhenVpnStarts,
                          onToggle: (connect) =>
                              _toggleConnectWhenVpnStarts(context, connect!),
                          margin:
                              const EdgeInsets.only(top: 32, left: 32, right: 32),
                          label:
                              LocaleKeys.settings_page_connect_when_starts.tr(),
                        ),
                        RadioSection(
                          margin:
                              const EdgeInsets.only(top: 32, left: 32, right: 32),
                          name: LocaleKeys.settings_page_protocols_title.tr(),
                          description:
                              LocaleKeys.settings_page_protocols_description.tr(),
                          enumOptions: const [...VpnProtocol.values],
                          selectedOption: state.vpnProtocol,
                          onTap: (Enum option) =>
                              _changeVpnProtocol(context, option as VpnProtocol),
                        ),
                        RadioSection(
                          margin:
                              const EdgeInsets.only(top: 32, left: 32, right: 32),
                          name: LocaleKeys.settings_page_connection_timeout_title
                              .tr(),
                          description: LocaleKeys
                              .settings_page_connection_timeout_description
                              .tr(),
                          enumOptions: const [...ConnectionTimeout.values],
                          selectedOption: state.connectionTimeout,
                          onTap: (Enum option) => _changeConnectionTimeout(
                              context, option as ConnectionTimeout),
                        ),
                        CheckboxSection(
                          margin:
                              const EdgeInsets.only(top: 32, left: 32, right: 32),
                          name: LocaleKeys.settings_page_batter_saver_title.tr(),
                          description: LocaleKeys
                              .settings_page_batter_saver_description
                              .tr(),
                          checked: state.batterySaver,
                          onCheck: () =>
                              _toggleBatterySaver(context, !state.batterySaver),
                        ),
                        // CheckboxSection(
                        //   margin:
                        //       const EdgeInsets.only(top: 32, left: 32, right: 32),
                        //   name:
                        //       LocaleKeys.settings_page_seamless_tunnel_title.tr(),
                        //   description: LocaleKeys
                        //       .settings_page_seamless_tunnel_description
                        //       .tr(),
                        //   checked: state.seamlessTunnel,
                        //   onCheck: () => _toggleSeamlessTunnel(
                        //       context, !state.seamlessTunnel),
                        // ),
                        CheckboxSection(
                          margin:
                          const EdgeInsets.only(top: 32, left: 32, right: 32),
                          name:
                          LocaleKeys.settings_page_ping_connection_title.tr(),
                          description: LocaleKeys
                              .settings_page_ping_connection_description
                              .tr(),
                          checked: state.pingConnection,
                          onCheck: () => _togglePingConnection(
                              context, !state.pingConnection),
                        ),
                        const SizedBox(height: 80)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
