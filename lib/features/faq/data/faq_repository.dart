import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sebek_vpn/features/faq/data/faq_api.dart';

import '../models/models.dart';

class FaqRepository {
  final Dio dio;

  List<Answer> faq = [];

  FaqRepository({required this.dio});

  Future<List<Answer>> loadFaq() async {
    try {
      final res = await dio.get(FaqApi.faq);
      List<dynamic> unformattedList = res.data;
      faq = unformattedList.map((dynamic f) => Answer.fromJson(f)).toList();
      return faq;
    } on DioError catch (err) {
      debugPrint(err.message);
      return [];
    }
  }
}
