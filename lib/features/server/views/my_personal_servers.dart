import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';

import '../widgets/widgets.dart';

class MyPersonalServers extends StatelessWidget {
  const MyPersonalServers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ServerCubit, ServerState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.getUserPersonalLocations().length,
            itemBuilder: (context, index) {
              return MyPersonalServerCard(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                server: state.getUserPersonalLocations()[index],
                // number: index + 1,
              );
            },
          );
        },
      ),
    );
  }
}
