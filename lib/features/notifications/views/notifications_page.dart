import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/notifications/cubit/notifications_cubit.dart';

import '../widgets/widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  static const String route = '/vpn/notifications';

  @override
  Widget build(BuildContext context) {
    apiHandler.getNotifications(context.read<NotificationsCubit>());

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: SvgPicture.asset('assets/images/back_arrow.svg'),
        ),
        title: Text(
          LocaleKeys.notifications_page_title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ).tr(),
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return ListView(
            children: [
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    notification: state.notifications[index],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
