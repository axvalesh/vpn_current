import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sebek_vpn/constants/data_source.dart';
import 'package:sebek_vpn/service/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

part 'account_api.dart';

class AccountRepository {
  AccountRepository({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(baseUrl: DataSource.root)) {
    this.dio.interceptors.add(authInterceptor());
  }

  Dio dio;

  User? user;
  bool? enableNotifications;

  void _setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> prolongSession() async {
    try {
      final res = await dio.get(AccountApi.session);
      _setToken(res.data['access_token']);
      user = User.fromJson(res.data['user']);
      enableNotifications = res.data['user']['enable_notifications'];

      return null;
    } on DioError catch (err) {
      debugPrint('${err.message} Session not find.');
      return 'session error';
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await dio.post(AccountApi.singIn, data: {
        'email': email,
        'password': password,
      });

      if (res.data['user'] != null) {
        user = User.fromJson(res.data['user']);
        enableNotifications = res.data['user']['enable_notifications'];
        String token = res.data['access_token'];
        _setToken(token);
        return 'success';
      } else {
        String message = await _signUp(email: email, password: password);
        return message;
      }
    } on DioError catch (err) {
      debugPrint('${err.message}');
      user = null;
      return err.response?.data['detail'] ?? 'sighIn error';
    }
  }

  Future<String> socialSignIn({required type, required token}) async {
    try {
      final res = await dio.post(AccountApi.singInWithSocials,
          data: {"soc_type": type, "soc_token": token});
      if (res.data['user'] != null) {
        user = User.fromJson(res.data['user']);
        enableNotifications = res.data['user']['enable_notifications'];
        String token = res.data['access_token'];
        _setToken(token);
        return 'success';
      }
    } on DioError catch (err) {
      debugPrint('${err.message}');
      return err.response?.data['detail'] ?? 'sighIn error';
    }
    return '';
  }

  Future<String> _signUp({
    required String email,
    required String password,
  }) async {
    try {
      final res = await dio.post(AccountApi.signUp, data: {
        'email': email,
        'password': password,
      });
      if (res.data['user'] != null) {
        user = User.fromJson(res.data['user']);
        _setToken(res.data['access_token']);
        return 'success';
      } else {
        return res.data['message'];
      }
    } on DioError catch (err) {
      debugPrint(err.response?.data['detail']);
      return err.response?.data['detail'] ?? 'sighUp error';
    }
  }

  Future<String?> sendRestorationCode({required String email}) async {
    try {
      final res =
          await dio.post(AccountApi.passwordRecoveryGetCode, queryParameters: {
        'email': email,
      });
      if (res.data['status'] == true) {
        return null;
      } else {
        return res.data['message'];
      }
    } on DioError catch (err) {
      debugPrint(err.message);
      return err.message ?? 'sendRestorationCode error';
    }
  }

  Future<String?> confirmRestorationCode(
      {required String email, required int code}) async {
    try {
      final res = await dio
          .post(AccountApi.passwordRecoveryCheckCode, queryParameters: {
        'email': email,
        'code': code,
      });
      if (res.data['status'] == true) {
        return null;
      } else {
        return res.data['message'];
      }
    } on DioError catch (err) {
      debugPrint(err.message);
      return err.message ?? 'confirmRestorationCode error';
    }
  }

  Future<String?> restorePassword({
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      final res =
          await dio.post(AccountApi.passwordRecoveryConfirm, queryParameters: {
        'email': email,
        'code': code,
        'password': password,
      });
      if (res.data['status'] == true) {
        return null;
      } else {
        return res.data['message'];
      }
    } on DioError catch (err) {
      debugPrint(err.message);
      return err.message ?? 'restorePassword error';
    }
  }
}
