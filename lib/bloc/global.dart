import 'package:sebek_vpn/bloc/password_recovery_cuit.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/bloc/settings_cubit.dart';
import 'package:sebek_vpn/bloc/subscription_cubit.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/vpn/cubit/vpn_cubit.dart';

ServerCubit SERVER_CUBIT = ServerCubit();
VpnCubit VPN_CUBIT = VpnCubit();
SettingsCubit SETTINGS_CUBIT = SettingsCubit();
PasswordRecoveryCubit PASSWORD_RECOVERY_CUBIT = PasswordRecoveryCubit();
AppSettingsCubit APP_SETTINGS_CUBIT = AppSettingsCubit();
SubscriptionCubit SUBSCRIPTION_CUBIT = SubscriptionCubit();
