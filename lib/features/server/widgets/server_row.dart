import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/features/server/models/models.dart';
import 'package:sebek_vpn/models/server.dart';

class ServerRow extends StatelessWidget {
  const ServerRow({Key? key, required this.server}) : super(key: key);

  final SimpleServer server;

  void _onTap(BuildContext context) {
    context.read<ServerCubit>().selectServer(server);
  }

  bool _isSelected(BuildContext context) {
    Server? selectedServer = context.read<ServerCubit>().state.selectedServer;
    if (selectedServer != null) {
      return context.read<ServerCubit>().state.selectedServer!.id == server.id;
    }
    return false;
  }

  int _locationPercent() {
    return (server.users / server.maxUsers * 100).round();
  }

  TextStyle _percentStyle() {
    return GoogleFonts.poppins(
      color: _locationPercent() <= 33 ? SebekColors.accent : _locationPercent() <= 67 ? SebekColors.orange : SebekColors.pink,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
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
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _onTap(context),
        child: Row(
          children: [
            Expanded(
              child: Text(
                server.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  server.ping != null ? Row(
                    children: [
                      Text('${_locationPercent()}%', style: _percentStyle()),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: _pingIcon(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          '${server.ping}ms',
                          style: GoogleFonts.poppins(
                            color: SebekColors.tertiary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ) : SizedBox(),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: SebekColors.secondary,
              onTap: () => _onTap(context),
              child: _isSelected(context)
                  ? SvgPicture.asset('assets/images/checkbox_active.svg')
                  : SvgPicture.asset('assets/images/checkbox.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
