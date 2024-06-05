import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sliding_segmented_control/sliding_segmented_control.dart';

import '../../search/search.dart';
import '../enums/enums.dart';
import '../widgets/widgets.dart';
import 'views.dart';

class SelectServerPage extends StatefulWidget {
  const SelectServerPage({Key? key}) : super(key: key);

  static const String route = '/vpn/select_server';

  @override
  State<SelectServerPage> createState() => _SelectServerPageState();
}

class _SelectServerPageState extends State<SelectServerPage> {
  ServerType pageState = ServerType.free;

  void _pageModeChanged(ServerType? server) {
    if (server != pageState && server != null) {
      setState(() {
        pageState = server;
      });
    }
  }

  Widget _getSection() {
    switch (pageState) {
      case ServerType.free:
        return const FreeServers();
      case ServerType.premium:
        return const PremiumServers();
      case ServerType.personal:
        return const PersonalServers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/images/back_arrow.svg'),
          ),
          title: Text(
            LocaleKeys.select_server_page_title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ).tr(),
        ),
        body: Column(
          children: [
            Search(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              hintText: LocaleKeys.select_server_page_search_placeholder.tr(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: SlidingSegmentedControl(
                  thumbColor: SebekColors.active,
                  groupValue: pageState,
                  onValueChanged: _pageModeChanged,
                  children: <ServerType, Widget>{
                    ServerType.free: SegmentedControlSegment(
                      pageState: pageState,
                      serverType: ServerType.free,
                      text: LocaleKeys.select_server_page_section_selector_free
                          .tr(),
                    ),
                    ServerType.premium: SegmentedControlSegment(
                      pageState: pageState,
                      serverType: ServerType.premium,
                      text: LocaleKeys
                          .select_server_page_section_selector_premium
                          .tr(),
                    ),
                    ServerType.personal: SegmentedControlSegment(
                      pageState: pageState,
                      serverType: ServerType.personal,
                      text: LocaleKeys
                          .select_server_page_section_selector_personal
                          .tr(),
                    ),
                  },
                ),
              ),
            ),
            _getSection()
          ],
        ),
      ),
    );
  }
}
