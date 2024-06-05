import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebek_vpn/models/server.dart';

class Settings {
  String playStoreLink;
  String appleStoreLink;

  Settings({
    required this.playStoreLink,
    required this.appleStoreLink,
  });
}

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(AppSettingsState());
}

class AppSettingsState {
  late Settings settings;

  AppSettingsState();
}
