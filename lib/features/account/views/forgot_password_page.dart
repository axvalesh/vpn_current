import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/common_widgets/rounded_text_field.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';

import '../cubit/account_cubit.dart';
import 'views.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const String route = '/sign_in/email/forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _email;
  String _errorMessage = '';
  bool _loading = false;

  bool _emailIsCorrect() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(_email.text) ||
        _email.text.isEmpty;
  }

  bool _validateEmail() {
    return _emailIsCorrect() && _errorMessage.isEmpty;
  }

  String _emailError() {
    if (!_emailIsCorrect()) return LocaleKeys.sign_in_email_error.tr();
    if (_errorMessage.isNotEmpty) return 'error.$_errorMessage'.tr();
    return '';
  }

  _sendCode(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    String? errorMessage = await context
        .read<AccountCubit>()
        .sendRestorationCode(email: _email.text);
    if (context.mounted && errorMessage == null) {
      PASSWORD_RECOVERY_CUBIT.state.email = _email.text;
      Navigator.pushNamed(context, ConfirmCodePage.route);
    } else {
      setState(() {
      _errorMessage = errorMessage!;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: SvgPicture.asset('assets/images/back_arrow.svg'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              LocaleKeys.sign_in_password_forgot_title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
          ),
          RoundedTextField(
            onChanged: (String email) {
              _errorMessage = '';
              setState(() {});
            },
            error: !_validateEmail(),
            errorMessage: _emailError(),
            controller: _email,
            margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
            label: LocaleKeys.sign_in_email_label.tr(),
            hintText: LocaleKeys.sign_in_email_hint.tr(),
          ),
          AccentButton(
            loading: _loading,
            onTap: _email.text.isNotEmpty && _validateEmail()
                ? () => _sendCode(context)
                : null,
            expanded: true,
            margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
            text: LocaleKeys.sign_in_send.tr(),
          )
        ],
      ),
    );
  }
}
