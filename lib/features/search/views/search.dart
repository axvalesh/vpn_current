import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/server_cubit.dart';
import 'package:sebek_vpn/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key, this.margin, this.hintText}) : super(key: key);

  final EdgeInsets? margin;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(
      text: context.read<ServerCubit>().state.search,
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: BlocBuilder<ServerCubit, ServerState>(
        builder: (context, state) {
          return TextField(
            cursorWidth: 1.5,
            cursorRadius: const Radius.circular(16),
            onChanged: (String searchText) {
              context.read<ServerCubit>().searchServer(searchText);
            },
            controller: searchController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              filled: true,
              fillColor: SebekColors.active,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: SvgPicture.asset(
                'assets/images/search.svg',
                width: 24,
                height: 24,
                fit: BoxFit.none,
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: SebekColors.tertiary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
