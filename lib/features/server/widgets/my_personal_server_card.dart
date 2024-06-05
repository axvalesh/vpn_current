import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/service.dart';

import '../models/models.dart';

class MyPersonalServerCard extends StatelessWidget {
  const MyPersonalServerCard({
    Key? key,
    this.margin,
    required this.server,
  }) : super(key: key);

  final EdgeInsets? margin;
  final PersonalServer server;

  void _onTap(BuildContext context) {
    context.read<ServerCubit>().selectServer(server);
  }

  bool _selected(BuildContext context) {
    Server? selectedServer = context.read<ServerCubit>().state.selectedServer;
    if (selectedServer != null) {
      return context.read<ServerCubit>().state.selectedServer!.id == server.id;
    }
    return false;
  }

  Widget _pingIcon() {
    return server.ping! <= 150
        ? SvgPicture.asset('assets/images/cell_signal_good.svg')
        : server.ping! <= 400
        ? SvgPicture.asset('assets/images/cell_signal_medium.svg')
        : SvgPicture.asset('assets/images/cell_signal_bad.svg');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => _onTap(context),
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            color: SebekColors.secondary,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(16),
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
                      child: SvgPicture.network(getFileUrl(
                          server.image
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          server.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          server.subTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: SebekColors.tertiary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              BlocBuilder<ServerCubit, ServerState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      server.ping != null ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              server.owners.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: _pingIcon(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              '${server.ping}ms',
                              style: GoogleFonts.poppins(
                                color: SebekColors.tertiary,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ) : SizedBox(),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        splashColor: SebekColors.secondary,
                        onTap: () => _onTap(context),
                        child: _selected(context)
                            ? SvgPicture.asset(
                                'assets/images/checkbox_active.svg')
                            : SvgPicture.asset('assets/images/checkbox.svg'),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
