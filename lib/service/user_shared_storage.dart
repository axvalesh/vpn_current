import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedStorage {
  static late SharedPreferences prefs;

  static getPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setToken(String token) async {
    await prefs.setString('token', token);
  }

  static String? getToken() {
    final String? token = prefs.getString('token');
    return token;
  }

  static setCurrentServer(String server) async {
    await prefs.setString('setCurrentServer', server);
  }

  static String getCurrentServer() {
    final String? token = prefs.getString('setCurrentServer');
    return token ?? '';
  }

  static setDateVPNStart(String server) async {
    await prefs.setString('dateVPNStart', server);
  }

  static String getDateVPNStart() {
    final String? token = prefs.getString('dateVPNStart');
    return token ?? '';
  }

  static setDateAdShow(String date) async {
    await prefs.setString('dateAdShow', date);
  }

  static String getDateAdShow() {
    final String? date = prefs.getString('dateAdShow');
    return date ?? '';
  }

  static clear() async {
    await prefs.clear();
  }
}