import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

DateFormat startVPNDateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

class IOSVPNEngine {
  Timer? _timer;

  dispose() {
    _timer!.cancel();
  }

  initialize(onChange) {
    String dateStartString = UserSharedStorage.getDateVPNStart();
    if (dateStartString == '') {
      return;
    }
    DateTime dateStart = startVPNDateFormat.parse(dateStartString);
    startTimer(dateStart, 0.toString(), 0.toString(), onChange);
  }

  startTimer(dateStart, byteIn, byteOut, onChange) {
    DateTime date = DateTime.now();
    int totalSeconds = date.difference(dateStart).inSeconds;

    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      int totalMinutes = (totalSeconds / 60).floor();
      int totalHours = (totalMinutes / 60).floor();
      String time =
          "${totalHours.toString().padLeft(2, "0")}:${(totalMinutes % 60).toString().padLeft(2, "0")}:${(totalSeconds % 60).toString().padLeft(2, "0")}";
      totalSeconds++;
      print(totalSeconds);
      var status = VpnStatus(
        duration: time,
        byteIn: byteIn,
        byteOut: byteOut,
        connectedOn: dateStart,
      );
      onChange(status);
    });
  }
}
