import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/service.dart';

class SelectedServerCard extends StatelessWidget {
  const SelectedServerCard({
    Key? key,
    required this.margin,
    required this.onChangeTapped,
  }) : super(key: key);

  final EdgeInsets? margin;
  final VoidCallback? onChangeTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
      builder: (context, state) {
        return Padding(
          padding: margin ?? EdgeInsets.zero,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onChangeTapped,
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: SebekColors.secondary,
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                          ),
                          child: SvgPicture.network(getFileUrl(state.selectedServer!.image)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.selectedServer!.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ).tr(),
                            Text(
                              state.selectedServer!.subTitle,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: SebekColors.tertiary,
                              ),
                            ).tr(),
                          ],
                        ),
                      )
                    ],
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    onPressed: onChangeTapped,
                    child: Row(
                      children: [
                        MediaQuery
                            .of(context)
                            .size
                            .width < 325
                            ? const SizedBox()
                            : Text(
                          LocaleKeys.connect_page_change,
                          style: GoogleFonts.poppins(
                            color: SebekColors.accent,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ).tr(),
                        SvgPicture.asset('assets/images/chevron_right.svg')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
