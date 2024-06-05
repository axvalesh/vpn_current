import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sebek_vpn/common_widgets/rounded_text_field.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/account.dart';

import 'views.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const String route = '/vpn/account';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
  builder: (context, state) {
    if (state is! AccountAuthorized) {
      return SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: SvgPicture.asset('assets/images/back_arrow.svg'),
        ),
        title: Text(
          LocaleKeys.account_page_title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ).tr(),
      ),
      body: Column(
        children: [
          RoundedTextField(
            enabled: false,
            controller: emailController..text = state.user.email,
            label: LocaleKeys.account_page_email.tr(),
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          ),
          RoundedTextField(
            enabled: false,
            controller: passwordController..text = '********',
            label: LocaleKeys.account_page_password.tr(),
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            actions: [
              CupertinoButton(
                onPressed: () => Navigator.pushNamed(context, RestorePasswordPage.route),
                child: Text(
                  LocaleKeys.account_page_change,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    color: SebekColors.accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
              )
            ],
          ),
        ],
      ),
    );
  },
);
  }
}
