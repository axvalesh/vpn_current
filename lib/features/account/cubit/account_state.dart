part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountUnauthorized extends AccountState {}

class AccountForgotPassword extends AccountState {
  final String email;

  AccountForgotPassword({required this.email});
}

class AccountRestorePassword extends AccountState {
  final String email;
  final String code;

  AccountRestorePassword({required this.email, required this.code});
}

class AccountAuthorized extends AccountState {
  final User user;
  bool enableNotifications;

  AccountAuthorized(this.user, this.enableNotifications);
}
