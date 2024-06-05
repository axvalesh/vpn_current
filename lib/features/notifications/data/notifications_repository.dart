import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/models.dart';
import 'notifications_api.dart';

class NotificationsRepository {
  NotificationsRepository({required this.dio}) {
    getData();
  }

  final Dio dio;

  List<NotificationModel> formattedData = [];
  final _controller = StreamController<List<NotificationModel>>();

  Future<void> getData() async {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
      final res = await dio.get(NotificationsApi.notifications);
      List<dynamic> unformattedList = res.data;
      List<NotificationModel> formattedList = unformattedList
          .map((dynamic n) => NotificationModel.fromJson(n))
          .toList();
      _controller.add(formattedList);
      } on DioError catch(err) {
        debugPrint(err.message);
      }
    });
  }

  Stream<List<NotificationModel>> data() async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();
}
