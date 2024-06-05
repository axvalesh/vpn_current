import 'package:dio/dio.dart';

import 'server_api.dart';

class ServerRepository{
  final Dio dio;

  ServerRepository({required this.dio});

  loadServers() async {
    try {
    final res = await dio.get(ServerApi.getServers);
    } on DioError catch (err) {

    }

  }
}