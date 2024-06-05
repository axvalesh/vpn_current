import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../search/search.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class BuyPersonalServerPage extends StatelessWidget {
  const BuyPersonalServerPage({Key? key}) : super(key: key);

  static const String route = '/vpn/buy_personal_server';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerCubit, ServerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: TextButton(
              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset('assets/images/back_arrow.svg'),
            ),
            title: Text(
              LocaleKeys.buy_personal_server_page_title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ).tr(),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Search(
                    margin: const EdgeInsets.only(
                        top: 8, left: 16, right: 16, bottom: 8),
                    hintText: LocaleKeys.buy_personal_server_page_search.tr(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state
                          .getPersonalLocations()
                          .length,
                      itemBuilder: (context, index) {
                        return BuyPersonalServerCard(
                          margin: const EdgeInsets.only(
                            top: 8,
                            left: 16,
                            right: 16,
                          ),
                          location: state.getPersonalLocations()[index],
                        );
                      },
                    ),
                  )
                ],
              ),
              SERVER_CUBIT.state.selectedBuyServer != null ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AccentButton(
                  onTap: () async {
                    String url = "https://buy.sebekvpn.app/personal?lang=en&sid=${SERVER_CUBIT.state.selectedBuyServer!.id}";
                    await launchUrlString(url);
                  },
                  expanded: true,
                  text: LocaleKeys.buy_personal_server_page_buy.tr(),
                  margin: const EdgeInsets.only(
                      bottom: 32, left: 16, right: 16),
                ),
              ) : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
