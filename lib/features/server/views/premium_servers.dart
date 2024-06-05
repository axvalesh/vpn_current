import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/server/models/models.dart';
import 'package:sebek_vpn/features/server/widgets/server_card.dart';

class PremiumServers extends StatelessWidget {
  const PremiumServers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
            child: Text(
              LocaleKeys.select_server_page_sections_recommended,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ).tr(),
          ),
          BlocBuilder<ServerCubit, ServerState>(
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.getPremiumRecommendLocations().length,
                itemBuilder: (context, index) {
                  return ServerCard(
                    location: state.getPremiumRecommendLocations()[index],
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
            child: Text(
              LocaleKeys.select_server_page_sections_all,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ).tr(),
          ),
          BlocBuilder<ServerCubit, ServerState>(
            builder: (context, state) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.getPremiumLocations().length,
                itemBuilder: (context, index) {
                  return ServerCard(
                    location: state.getPremiumLocations()[index],
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
