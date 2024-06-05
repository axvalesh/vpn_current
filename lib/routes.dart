import 'package:flutter/widgets.dart';
import 'package:sebek_vpn/features/session/views/session_page.dart';
import 'package:sebek_vpn/features/vpn/views/speed_test_page.dart';

import 'features/account/account.dart';
import 'features/faq/faq.dart';
import 'features/notifications/notifications.dart';
import 'features/premium/premium.dart';
import 'features/server/server.dart';
import 'features/settings/settings.dart';
import 'features/vpn/vpn.dart';

Map<String, Widget Function(BuildContext)> namedRoutes = {
  SessionPage.route: (_) => const SessionPage(),
  SignInPage.route: (_) => const SignInPage(),
  EmailSignInPage.route: (_) => const EmailSignInPage(),
  ForgotPasswordPage.route: (_) => const ForgotPasswordPage(),
  ConfirmCodePage.route: (_) => const ConfirmCodePage(),
  RestorePasswordPage.route: (_) => RestorePasswordPage(),
  ConnectPage.route: (_) => const ConnectPage(),
  SelectServerPage.route: (_) => const SelectServerPage(),
  BuyPersonalServerPage.route: (_) => const BuyPersonalServerPage(),
  NotificationsPage.route: (_) => const NotificationsPage(),
  AccountPage.route: (_) => const AccountPage(),
  OfferPage.route: (_) => const OfferPage(),
  SettingsPage.route: (_) => const SettingsPage(),
  FaqPage.route: (_) => const FaqPage(),
  SpeedTestPage.route: (_) => SpeedTestPage(),
};