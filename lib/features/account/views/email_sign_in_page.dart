import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/common_widgets/rounded_text_field.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/cubit/account_cubit.dart';
import 'package:sebek_vpn/features/session/views/session_page.dart';
import 'package:sebek_vpn/service/service.dart';

import 'views.dart';
import '../../vpn/vpn.dart';
import '../widgets/widgets.dart';

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  static const String route = '/sign_in/email';

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  bool _passwordVisible = false;
  late final TextEditingController _email;
  late final TextEditingController _password;

  bool _loading = false;
  String errorMessage = '';

  void _togglePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool _emailIsCorrect() {
    return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(_email.text) ||
        _email.text.isEmpty;
  }

  bool _validateEmail() {
    return _emailIsCorrect() && errorMessage.isEmpty;
  }

  String _emailError() {
    if (!_emailIsCorrect()) return LocaleKeys.sign_in_email_error.tr();
    if (errorMessage.isNotEmpty) return errorMessage;
    return '';
  }

  _passwordIsNotSmall() {
    return _password.text.isNotEmpty && _password.text.length >= 8 ||
        _password.text.isEmpty;
  }

  _passwordNotTooBig() {
    return _password.text.length <= 32 || _password.text.isEmpty;
  }

  bool _validatePassword() {
    return _passwordIsNotSmall() &&
        _passwordNotTooBig() &&
        errorMessage.isEmpty;
  }

  String _passwordError() {
    if (!_passwordIsNotSmall())
      return LocaleKeys.sign_in_password_error_small.tr();
    if (!_passwordNotTooBig())
      return LocaleKeys.sign_in_password_error_big.tr();
    if (errorMessage.isNotEmpty) return errorMessage;
    return '';
  }

  bool _validateForm() {
    return _validateEmail() &&
        _validatePassword() &&
        _email.text.isNotEmpty &&
        _password.text.isNotEmpty;
  }

  void _signIn(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    String? message = await context
        .read<AccountCubit>()
        .signIn(email: _email.text, password: _password.text);

    if (message == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, SessionPage.route, (Route<dynamic> route) => false);
    } else {
      setState(() {
        errorMessage = LocaleKeys.incorrect_username_or_password.tr();
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: SvgPicture.asset('assets/images/back_arrow.svg'),
        ),
        title: Text(
          LocaleKeys.app_title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ).tr(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    LocaleKeys.sign_in_with_email,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                  ).tr(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      RoundedTextField(
                        onChanged: (String text) {
                          errorMessage = '';
                          setState(() {});
                        },
                        error: !_validateEmail(),
                        errorMessage: _emailError(),
                        controller: _email,
                        margin:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        label: LocaleKeys.sign_in_email_label.tr(),
                        hintText: LocaleKeys.sign_in_email_hint.tr(),
                      ),
                      RoundedTextField(
                        onChanged: (String text) {
                          errorMessage = '';
                          setState(() {});
                        },
                        error: !_validatePassword(),
                        errorMessage: _passwordError(),
                        controller: _password,
                        obscureText: !_passwordVisible,
                        margin:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        label: LocaleKeys.sign_in_password_label.tr(),
                        labelActionText:
                            LocaleKeys.sign_in_password_forgot_link.tr(),
                        labelActionOnPressed: () => Navigator.pushNamed(
                            context, ForgotPasswordPage.route),
                        hintText: LocaleKeys.sign_in_password_hint.tr(),
                        actions: [
                          CupertinoButton(
                            onPressed: _togglePasswordVisible,
                            child: _passwordVisible
                                ? SvgPicture.asset(
                                    'assets/images/eye_slash.svg')
                                : SvgPicture.asset('assets/images/eye.svg'),
                          )
                        ],
                      ),
                      AccentButton(
                        loading: _loading,
                        onTap: _validateForm() ? () => _signIn(context) : null,
                        expanded: true,
                        margin:
                            const EdgeInsets.only(top: 32, left: 16, right: 16),
                        text: LocaleKeys.sign_in_email_button.tr(),
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
