import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sebek_vpn/features/notifications/cubit/notifications_cubit.dart';

class NotificationsBell extends StatelessWidget {
  const NotificationsBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return SvgPicture.asset('assets/images/bell.svg');
      },
    );
  }
}
