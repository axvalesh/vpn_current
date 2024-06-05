import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:sebek_vpn/features/session/views/session_page.dart';
import 'package:sebek_vpn/routes.dart';
import 'package:sebek_vpn/theme.dart';

import 'bloc/global.dart';
import 'features/account/account.dart';
import 'features/settings/settings.dart';
import 'features/vpn/vpn.dart';
import 'features/notifications/notifications.dart';
import 'features/vpn/ticker.dart';

class SebekApp extends StatelessWidget {
  const SebekApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VPN_CUBIT),
        BlocProvider(create: (context) => SERVER_CUBIT),
        BlocProvider(create: (context) => SETTINGS_CUBIT),
        BlocProvider(
          create: (context) => NotificationsCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return InAppNotification(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: sebekTheme(context),
            onGenerateRoute: (RouteSettings settings) => CupertinoPageRoute(
              builder: namedRoutes[settings.name]!,
              settings: settings,
            ),
            initialRoute: SessionPage.route,
          ),
        );
      }),
    );
  }
}
