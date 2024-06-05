import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future loginApple() async {
  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );

  return credential.identityToken;
}