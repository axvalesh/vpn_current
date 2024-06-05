import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/session/views/session_page.dart';

import '../../vpn/vpn.dart';
import '../cubit/account_cubit.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const String route = '/sign_in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.app_title,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: SebekColors.white),
        ).tr(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.sign_in_title,
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ).tr(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Platform.isIOS ? SocialSignInButton(
                        onPressed: () async {
                          await context
                              .read<AccountCubit>()
                              .socialSignIn(type: 'apple');
                          Navigator.pushReplacementNamed(context, SessionPage.route);
                        },
                        margin:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                        text: LocaleKeys.sign_in_with_apple,
                        color: SebekColors.white,
                        backgroundColor: Colors.black,
                        picture: SvgPicture.asset(
                          'assets/images/apple.svg',
                          height: 40,
                          width: 40,
                        ),
                      ) : SizedBox(),
                      SocialSignInButton(
                        onPressed: () async {
                          await context
                              .read<AccountCubit>()
                              .socialSignIn(type: 'google');
                          Navigator.pushReplacementNamed(context, SessionPage.route);
                        },
                        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        text: LocaleKeys.sign_in_with_google,
                        color: SebekColors.black2,
                        backgroundColor: Colors.white,
                        picture: SvgPicture.asset(
                          'assets/images/google.svg',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      AccentButton(
                        onTap: () =>
                            Navigator.pushNamed(context, EmailSignInPage.route),
                        expanded: true,
                        margin:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                        text: LocaleKeys.sign_in_with_email.tr(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const TermsAndConditions(
            margin: EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}
