import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'dart:io';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn(
    clientId: Platform.isIOS ? "1099080661698-jmfl8ppbl6ij7q5h0e2o4iligarsiq8k.apps.googleusercontent.com" : null,
  );

  static login() async {
    final googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    return googleAuth.idToken;
  }
}

loginGoogle() async {
  return await GoogleSignInAPI.login();
}