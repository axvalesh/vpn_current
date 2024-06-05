import 'dart:io';

import 'package:in_app_notification/in_app_notification.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/features/custom_notification.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:http/http.dart' as http;
import 'package:dart_ping/dart_ping.dart';
import 'package:url_launcher/url_launcher_string.dart';

getFileUrl(url) {
  return 'https://api.sebekvpn.app/$url';
}

showAlert({
  error = false,
  required text,
  required context,
}) {
  InAppNotification.show(
    duration: Duration(seconds: 2),
    child: CustomNotification(
      error: error,
      text: text,
    ),
    context: context,
  );
}

Future<bool> showRating() async {
  String url = Platform.isIOS ? APP_SETTINGS_CUBIT.state.settings.appleStoreLink : APP_SETTINGS_CUBIT.state.settings.playStoreLink;
  await launchUrlString(url);
  return true;
  final InAppReview inAppReview = InAppReview.instance;

  try {
    final available = await inAppReview.isAvailable();
    if (available) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: "sebekvpn.feelweel.com",
      );
    }
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

getServersPing() async {
  List locations = SERVER_CUBIT.state.locations;
  for (SimpleLocation location in locations) {
    for (SimpleServer server in location.servers) {
      await getServerPing(server);
    }
  }
}

getServerPing(server) async {
  final result = await Ping(server.ip, count: 1).stream.first;
  print('PING RESULT ${server.ip}');
  print(result.response);
  if (result.response != null) {
    if (result.response!.time != null) {
      SERVER_CUBIT.changeServer(server.id, result.response!.time!.inMilliseconds);
    }
  }
}
