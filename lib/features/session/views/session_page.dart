import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/features/account/account.dart';
import 'package:sebek_vpn/features/account/cubit/account_cubit.dart';
import 'package:sebek_vpn/features/settings/cubit/settings_cubit.dart';
import 'package:sebek_vpn/features/vpn/views/connect_page.dart';
import 'package:sebek_vpn/service/fcm_helper.dart';
import 'package:sebek_vpn/service/main_vpn_engine.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

class SessionPage extends StatefulWidget {
  static const String route = '/';

  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  getSession () async {
    // await UserSharedStorage.clear();

    var result = await context.read<AccountCubit>().continueSession();

    if (result == null) {
      // var ftoken = await getToken();
      // await apiHandler.firebase(firebase: ftoken);

      SETTINGS_CUBIT.loadSettings();

      await apiHandler.getServers();
      await apiHandler.getPersonalServers();
      await apiHandler.getUserPersonalServers();
      await apiHandler.getSettings();
      debugPrint('before getting sybsctipriont');
      await apiHandler.getSubscription();

      var accountState = context.read<AccountCubit>().state;
      if (accountState is AccountAuthorized) {
        context.read<SettingsCubit>().toggleNotifications(accountState.enableNotifications);
      }

       if (await Purchases.isAnonymous) {
        debugPrint('setted token to ${context.read<AccountCubit>().accountRepository.user?.id}');
          await Purchases.logIn(context.read<AccountCubit>().accountRepository.user?.id ?? 'notiddefined');
      } else {
        debugPrint('purchase is not anonymous');
      }

      await mainVPNEngine.enableVpnWhenStart();

      Navigator.pushNamedAndRemoveUntil(context, ConnectPage.route, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, SignInPage.route, (route) => false);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getSession();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: SebekColors.primary,
      child: Center(
        child: Image.asset('assets/images/sebek_logo.png'),
      ),
    );
  }
}