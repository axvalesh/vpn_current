import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/account.dart';
import 'package:sebek_vpn/features/faq/cubit/faq_cubit.dart';
import 'package:sebek_vpn/features/faq/data/faq_repository.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  static const String route = '/vpn/faq';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          FaqRepository(dio: context.read<AccountRepository>().dio),
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (context) =>
              FaqCubit(faqRepository: context.read<FaqRepository>())..loadFaq(),
          child: BlocBuilder<FaqCubit, FaqState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  leading: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/images/back_arrow.svg'),
                  ),
                  title: Text(
                    LocaleKeys.faq_page_title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ).tr(),
                ),
                body: BlocBuilder<FaqCubit, FaqState>(
                  builder: (context, state) {
                    if (state is FaqLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.answers.length,
                        itemBuilder: (BuildContext context, int index) {
                          Answer answer = state.answers[index];
                          String lang = context.locale.languageCode;
                          String title = answer.title;
                          String text = answer.text;
                          if (lang != 'en') {
                            switch (lang) {
                              case 'de':
                                title = answer.de_title ?? title;
                                text = answer.de_text ?? text;
                                break;
                              case 'fr':
                                title = answer.fr_title ?? title;
                                text = answer.fr_text ?? text;
                                break;
                              case 'pl':
                                title = answer.pl_title ?? title;
                                text = answer.pl_text ?? text;
                                break;
                              case 'ru':
                                title = answer.ru_title ?? title;
                                text = answer.ru_text ?? text;
                                break;
                              case 'uk':
                                title = answer.uk_title ?? title;
                                text = answer.uk_text ?? text;
                                break;
                            }
                          }
                          return FaqCard(
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            title: title,
                            description: text,
                          );
                        },
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 96),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: SebekColors.accent,
                          radius: 16,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
