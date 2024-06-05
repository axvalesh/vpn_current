import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sebek_vpn/models/notification.dart';

import '../models/models.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key, required this.notification, this.margin})
      : super(key: key);

  final Notify notification;
  final EdgeInsets? margin;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _expanded = false;

  String _descriptionText() {
    // substring(0, _expanded ? null : 70);
    return widget.notification.text;
  }

  _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
    super.initState();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: widget.notification.seen ? null : SebekColors.secondary,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.notification.title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.notification.date,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: SebekColors.accent,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _descriptionText(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    // TextSpan(
                    //     text: LocaleKeys.notifications_page_more.tr(),
                    //     style: GoogleFonts.poppins(
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 14,
                    //       decoration: TextDecoration.underline,
                    //       color: SebekColors.accent,
                    //     ),
                    //     recognizer: _tapGestureRecognizer)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
