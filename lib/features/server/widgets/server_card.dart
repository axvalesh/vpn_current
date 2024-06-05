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

import '../models/models.dart';
import '../widgets/widgets.dart';

class ServerCard extends StatefulWidget {
  final SimpleLocation location;

  const ServerCard({
    Key? key,
    required this.location,
    this.margin,
  }) : super(key: key);

  final EdgeInsets? margin;

  @override
  State<ServerCard> createState() => _ServerCardState();
}

class _ServerCardState extends State<ServerCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  _locationsText(BuildContext context) {
    int count = widget.location.servers.length;
    String one = LocaleKeys.select_server_page_location.tr();
    String many = LocaleKeys.select_server_page_locations.tr();
    return '${count > 1 ? many : one} $count';
  }

  void _onTap() {
    setState(() {
      _expanded = !_expanded;
    });
    if (_expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: SebekColors.secondary,
        ),
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: SvgPicture.network(getFileUrl(
                          widget.location.image,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.location.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                widget.location.type == 'free'
                                    ? const SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: SvgPicture.asset(
                                          'assets/images/crown_small_bg.svg',
                                        ),
                                      ),
                              ],
                            ),
                            Text(
                              _locationsText(context),
                              style: GoogleFonts.poppins(
                                color: SebekColors.tertiary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onPressed: _onTap,
                    child: AnimatedRotation(
                      turns: _expanded ? -.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: SvgPicture.asset('assets/images/chevron_down.svg'),
                    ),
                  )
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: BlocBuilder<ServerCubit, ServerState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.location.servers.length,
                    itemBuilder: (context, index) {
                      SimpleServer server = widget.location.servers[index];
                      return ServerRow(
                        server: server,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
