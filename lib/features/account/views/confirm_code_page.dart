import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';

import '../cubit/account_cubit.dart';
import 'views.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({Key? key}) : super(key: key);

  static const String route = '/sign_in/email/confirm_code';

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> {
  late TextEditingController _code;
  String _errorMessage = '';
  bool _loading = false;

  void _submitCode(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    String? errorMessage = await context
        .read<AccountCubit>()
        .confirmRestorationCode(code: int.parse(_code.text));
    if (context.mounted && errorMessage == null) {
      PASSWORD_RECOVERY_CUBIT.state.code = _code.text;
      Navigator.pushReplacementNamed(context, RestorePasswordPage.route);
    } else {
      _errorMessage = 'error.${errorMessage!}'.tr();
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _code = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _code.dispose();
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
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Text(
              LocaleKeys.sign_in_confirmation_code_title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                String confirmEmail = 'example@mail.com';
                if (state is AccountForgotPassword) confirmEmail = state.email;

                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: LocaleKeys.sign_in_confirmation_code_description1
                            .tr(),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: confirmEmail,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      const TextSpan(text: '. '),
                      TextSpan(
                        text: LocaleKeys.sign_in_confirmation_code_description2
                            .tr(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: PinCodeTextField(
              autoDisposeControllers: false,
              controller: _code,
              length: 4,
              appContext: context,
              onChanged: (String code) {
                _errorMessage = '';
                setState(() {});
              },
              onCompleted: (String code) => _submitCode(context),
              enableActiveFill: true,
              showCursor: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              hintCharacter: '_',
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: SebekColors.tertiary,
              ),
              textStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: SebekColors.white,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldWidth: 80,
                fieldHeight: 56,
                borderRadius: BorderRadius.circular(16),
                inactiveFillColor: SebekColors.secondary,
                inactiveColor: SebekColors.secondary,
                selectedColor: SebekColors.tertiary,
                selectedFillColor: SebekColors.secondary,
                activeColor: SebekColors.secondary,
                activeFillColor: SebekColors.secondary,
                borderWidth: 1,
              ),
            ),
          ),
          _errorMessage.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _errorMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: SebekColors.pink,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
          AccentButton(
            loading: _loading,
            onTap: _code.text.length == 4 ? () => _submitCode(context) : null,
            margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
            expanded: true,
            text: LocaleKeys.sign_in_send.tr(),
          ),
        ],
      ),
    );
  }
}
