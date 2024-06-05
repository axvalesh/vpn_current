part of 'account_repository.dart';

class AccountApi {
  static const String singIn = '/api/auth/sign_in/';
  static const String singInWithSocials = '/api/auth/social_sign_in/';
  static const String signUp = '/api/auth/sign_up/';
  static const String session = '/api/auth/session/';
  static const String passwordRecoveryGetCode = '/api/auth/password_recovery/';
  static const String passwordRecoveryCheckCode = '/api/auth/password_recovery_check/';
  static const String passwordRecoveryConfirm = '/api/auth/password_recovery_confirm/';
  static const String userChangePassword = '/api/auth/password_recovery_confirm/';
  static const String firebaseToken = '/api/user/firebase/';
}