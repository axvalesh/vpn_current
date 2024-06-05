import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/common_widgets/rounded_text_field.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/account.dart';

class RestorePasswordPage extends StatefulWidget {
  RestorePasswordPage({
    Key? key,
    this.isRecovery = false,
  }) : super(key: key);

  static const String route = '/sign_in/email/restore_password';
  bool isRecovery;

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  bool _loading = false;
  String _errorMessage = '';
  late TextEditingController _newPassword;
  bool _newPasswordVisible = false;

  late TextEditingController _confirmPassword;
  bool _confirmPasswordVisible = false;

  void _toggleNewPasswordVisible() {
    setState(() {
      _newPasswordVisible = !_newPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisible() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  bool _passwordAreIdentical() {
    return _newPassword.text == _confirmPassword.text;
  }

  bool _confirmPasswordValid() {
    return _confirmPassword.text.isEmpty ||
        _confirmPassword.text.isNotEmpty && _passwordAreIdentical();
  }

  bool _validatePassword() {
    return _newPassword.text.isNotEmpty &&
            _passwordIsNotSmall(_newPassword.text) &&
            _passwordNotTooBig(_newPassword.text) ||
        _newPassword.text.isEmpty && _errorMessage.isEmpty;
  }

  bool _passwordsAreValid() {
    return _passwordAreIdentical() &&
        _validatePassword() &&
        _newPassword.text.isNotEmpty;
  }

  _passwordIsNotSmall(String password) {
    return password.isNotEmpty && password.length >= 8 || password.isEmpty;
  }

  _passwordNotTooBig(String password) {
    return password.length <= 32 || password.isEmpty;
  }

  String _passwordError() {
    if (!_passwordIsNotSmall(_newPassword.text)) {
      return LocaleKeys.sign_in_password_error_small.tr();
    }
    if (!_passwordNotTooBig(_newPassword.text)) {
      return LocaleKeys.sign_in_password_error_big.tr();
    }
    if (_errorMessage.isNotEmpty) return 'error_$_errorMessage'.tr();
    return '';
  }

  _submitPassword(BuildContext context) async {
    if (widget.isRecovery) {
      setState(() => _loading = true);

      var result = await apiHandler.changePassword(_newPassword.text);
      if (result['status']) {
        Navigator.pushReplacementNamed(context, AccountPage.route);
      }
    } else {
      setState(() => _loading = true);

      var result = await apiHandler.recoverPassword(_newPassword.text);
      if (result['status']) {
        Navigator.pushReplacementNamed(context, EmailSignInPage.route);
      }
    }
  }

  @override
  void initState() {
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _confirmPassword.dispose();
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
              LocaleKeys.sign_in_password_change,
              style: GoogleFonts.poppins(
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
                  onChanged: (String newPassword) {
                    setState(() {});
                  },
                  error: !_validatePassword(),
                  errorMessage: _passwordError(),
                  controller: _newPassword,
                  obscureText: !_newPasswordVisible,
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  label: LocaleKeys.sign_in_password_new_label.tr(),
                  hintText: LocaleKeys.sign_in_password_hint.tr(),
                  actions: [
                    CupertinoButton(
                      onPressed: _toggleNewPasswordVisible,
                      child: _newPasswordVisible
                          ? SvgPicture.asset('assets/images/eye_slash.svg')
                          : SvgPicture.asset('assets/images/eye.svg'),
                    )
                  ],
                ),
                RoundedTextField(
                  onChanged: (String confirmPassword) {
                    setState(() {});
                  },
                  error: !_confirmPasswordValid(),
                  errorMessage: LocaleKeys.sign_in_password_confirm_error.tr(),
                  controller: _confirmPassword,
                  obscureText: !_confirmPasswordVisible,
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  label: LocaleKeys.sign_in_password_confirm_label.tr(),
                  hintText: LocaleKeys.sign_in_password_hint.tr(),
                  actions: [
                    CupertinoButton(
                      onPressed: _toggleConfirmPasswordVisible,
                      child: _confirmPasswordVisible
                          ? SvgPicture.asset('assets/images/eye_slash.svg')
                          : SvgPicture.asset('assets/images/eye.svg'),
                    )
                  ],
                ),
              ],
            ),
          ),
          AccentButton(
            loading: _loading,
            onTap: _passwordsAreValid() ? () => _submitPassword(context) : null,
            expanded: true,
            margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
            text: LocaleKeys.sign_in_save.tr(),
          )
        ],
      ),
    );
  }
}
