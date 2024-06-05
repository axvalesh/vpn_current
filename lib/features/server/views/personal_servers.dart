import 'package:flutter/material.dart';
import 'package:sebek_vpn/bloc/global.dart';

import 'views.dart';

class PersonalServers extends StatelessWidget {
  const PersonalServers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SERVER_CUBIT.state.getUserPersonalLocations().isEmpty
        ? const NoPersonalServers()
        : const MyPersonalServers();
  }
}
