import 'package:bloc/bloc.dart';

class PasswordRecoveryCubit extends Cubit<PasswordRecoveryState> {
  PasswordRecoveryCubit() : super(PasswordRecoveryState());
}

class PasswordRecoveryState {
  String email;
  String code;

  PasswordRecoveryState({
    this.email = '',
    this.code = '',
  });
}
