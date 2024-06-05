import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sebek_vpn/features/account/data/account_repository.dart';
import 'package:sebek_vpn/service/apple_login.dart';
import 'package:sebek_vpn/service/google_login.dart';

import '../models/models.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.accountRepository) : super(AccountUnauthorized());

  final AccountRepository accountRepository;

  Future<String?> continueSession() async {
    String? message = await accountRepository.prolongSession();
    if (message == null) {
      emit(AccountAuthorized(accountRepository.user!, accountRepository.enableNotifications!));
    } else {
      emit(AccountUnauthorized());
    }
    return message;
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    String message =
        await accountRepository.signIn(email: email, password: password);
    User? user = accountRepository.user;
    if (user != null) {
      accountRepository.enableNotifications ??= true;
      emit(AccountAuthorized(user, accountRepository.enableNotifications!));
      return null;
    } else {
      emit(AccountUnauthorized());
      debugPrint(message);
      return message;
    }
  }

  Future<String?> socialSignIn(
      {type}) async {
    var token;
    if (type == 'google') {
      token = await loginGoogle();
    } else if (type == 'apple') {
      token = await loginApple();
    }

    String message =
    await accountRepository.socialSignIn(type: type, token: token);
    User? user = accountRepository.user;
    if (user != null) {
      emit(AccountAuthorized(user, accountRepository.enableNotifications!));
      return null;
    } else {
      emit(AccountUnauthorized());
      debugPrint(message);
      return message;
    }
  }

  signOut() {}

  Future<String?> sendRestorationCode({required String email}) async {
    String? message = await accountRepository.sendRestorationCode(email: email);
    emit(AccountForgotPassword(email: email));
    return message;
  }

  Future<String?> confirmRestorationCode({required int code}) async {
    if (state is AccountForgotPassword) {
      String email = (state as AccountForgotPassword).email;
      String? errorMessage = await accountRepository.confirmRestorationCode(
        email: email,
        code: code,
      );
      if (errorMessage == null) {
        emit(AccountRestorePassword(email: email, code: code.toString()));
      }
      return errorMessage;
    }
    return 'Re-input your email, it was lost due to some error';
  }

  Future<String?> restorePassword({required String password}) async {
    if (state is AccountRestorePassword) {
      AccountRestorePassword currentState = (state as AccountRestorePassword);
      String? errorMessage = await accountRepository.restorePassword(
        email: currentState.email,
        code: currentState.code,
        password: password,
      );
      if (errorMessage == null) emit(AccountUnauthorized());
      return errorMessage;
    }
    return 'Re-input your code, it was lost due to some error';
  }
}
