import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sebek_vpn/api/api_core.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/common_widgets/rounded_text_field.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/account/account.dart';
import 'package:sebek_vpn/features/session/views/session_page.dart';
import 'package:sebek_vpn/service/google_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                onPressed: () => Navigator.pushNamed(context, RestorePasswordPage.route, arguments: {
                  'changePassword': true
                }),
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
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 16,),
              InkWell(
                onTap: () {
              showDialog(context: context,barrierDismissible: true, builder: (build) {
                  return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 70),
                child: Container(
                padding: const EdgeInsets.symmetric(vertical:60,horizontal:32.5),
                decoration: BoxDecoration(
                  color: Color(0xff1E2142).withOpacity(0.98),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0) 
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Text(
                      "You’re about to delete your profile!",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                     ),
                  
                     
                  
                     SizedBox(height: 50,),
                  
                      AccentButton(expanded: true,text: "CANCEL",onTap: () async {
                       Navigator.pop(context);
                     },),
              
                     SizedBox(height: 20,),
                  
                     AccentButton(expanded: true,text: "DELETE",onTap: () async {
                       APICore apiCore = APICore();
                       
                  
                      await apiCore.deleteAccount();

                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      await preferences.clear();

                     
                    final GoogleSignInAPI googleSignIn = GoogleSignInAPI();

                    await googleSignIn.signOut();


                      Navigator.pushNamedAndRemoveUntil(context, SessionPage.route, (route) => false);
                     
                     },),
                     
                  
                     
                    ],
                  ),
                ),
                  ),
              ),
                      
                    );
                });
                },
                child: Container(
                  height: 40,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red
                  ),
                  child: Text(
                    "Delete Account",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                  ),
                ),
              ),
            ],
          ),
          
         
        ],
      ),
    );
  },
);
  }
}
