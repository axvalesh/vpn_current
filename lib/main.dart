import 'dart:io';

import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sebek_vpn/app.dart';
import 'package:sebek_vpn/constants/codegen_loader.g.dart';
import 'package:sebek_vpn/constants/data_source.dart';
import 'package:sebek_vpn/features/account/account.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    DartPingIOS.register();
  }

  // await initializeFirebase();

  await EasyLocalization.ensureInitialized();

  /// Register of the Poppins font licence
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/google_fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  await UserSharedStorage.getPrefs();

  HttpOverrides.global = MyHttpOverrides();

  // await initializeService();
  // FlutterBackgroundService().invoke("setAsForeground");
  await MobileAds.instance.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
        Locale('fr'),
        Locale('pl'),
        Locale('ru'),
        Locale('uk'),
      ],
      path: 'assets/localizations',
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      child: RepositoryProvider(
        create: (BuildContext context) {
          return AccountRepository(
            dio: Dio(BaseOptions(
              baseUrl: DataSource.root,
              headers: {
                'Authorization': 'Bearer ${UserSharedStorage.getToken()}',
              },
            )),
          );
        },
        child: Builder(builder: (context) {
          return BlocProvider<AccountCubit>(
            create: (context) => AccountCubit(context.read<AccountRepository>()),
            child: const SebekApp(),
          );
        }),
      ),
    ),
  );
}
