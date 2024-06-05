import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/service.dart';

import '../models/models.dart';
import 'widgets.dart';

class BuyPersonalServerCard extends StatefulWidget {
  const BuyPersonalServerCard({
    Key? key,
    this.margin,
    required this.location,
  }) : super(key: key);

  final EdgeInsets? margin;
  final PersonalLocation location;

  @override
  State<BuyPersonalServerCard> createState() => _BuyPersonalServerCardState();
}

class _BuyPersonalServerCardState extends State<BuyPersonalServerCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

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
    return BlocBuilder<ServerCubit, ServerState>(
      builder: (context, state) {
        return Padding(
          padding: widget.margin ?? EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: SebekColors.secondary,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _onTap,
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
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
                                  Text(
                                    widget.location.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    widget.location.subTitle,
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
                      ),
                      CupertinoButton(
                        onPressed: _onTap,
                        child: AnimatedRotation(
                          turns: _expanded ? .5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: SvgPicture.asset(
                              'assets/images/chevron_down.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizeTransition(
                  sizeFactor: _expandAnimation,
                  child: Column(
                    children: [
                      for (PersonalServer server in widget.location.servers)
                        BuyPersonalServerRow(
                          title: "${server.title} / \$${server.price}",
                          purchasedCount: server.owners,
                          availableCount: server.maxOwners,
                          onCheck: () {
                            SERVER_CUBIT.selectBuyServer(server);
                          },
                          active: state.selectedBuyServer == server,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
