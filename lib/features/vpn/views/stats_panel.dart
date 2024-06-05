import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/vpn/widgets/widgets.dart';

import '../cubit/vpn_cubit.dart';

class StatsPanel extends StatelessWidget {
  const StatsPanel({Key? key, this.margin}) : super(key: key);

  final EdgeInsets? margin;

  getSpeedValue(stringValue) {
    int value = int.parse(stringValue);
    if (value > 1000) {
      return '${(value / 1000).round()} Kb';
    } else if (value > 1000000) {
      return '${(value / 1000000).round()} Mb';
    } else if (value > 1000000000) {
      return '${(value / 1000000000).round()} Gb';
    } else {
      return '$value b';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnCubit, VpnState>(
      builder: (context, state) {
        return Padding(
          padding: margin ?? EdgeInsets.zero,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsBadge(
                    label: LocaleKeys.connect_page_stats_download.tr(),
                    data: getSpeedValue(state.status!.byteIn),
                    icon: SvgPicture.asset('assets/images/download.svg'),
                  ),
                  const SizedBox(width: 8),
                  StatsBadge(
                    label: LocaleKeys.connect_page_stats_upload.tr(),
                    data: getSpeedValue(state.status!.byteOut),
                    icon: SvgPicture.asset('assets/images/upload.svg'),
                  ),
                  context.read<SettingsCubit>().state.pingConnection
                      ? const SizedBox(width: 8)
                      : SizedBox(),
                  context.read<SettingsCubit>().state.pingConnection ? StatsBadge(
                          label: LocaleKeys.connect_page_stats_ping.tr(),
                          data: '${state.ping} ms',
                          icon: state.ping <= 150
                              ? SvgPicture.asset(
                                  'assets/images/cell_signal_good.svg')
                              : state.ping <= 400
                                  ? SvgPicture.asset(
                                      'assets/images/cell_signal_medium.svg')
                                  : SvgPicture.asset(
                                      'assets/images/cell_signal_bad.svg'),
                        )
                      : SizedBox(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  children: const [
                    ConnectionIp(),
                    Timer(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
