import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

InterceptorsWrapper authInterceptor() {
  return InterceptorsWrapper(
    onRequest: (options, handler) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('token');
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        // print(options.headers['Authorization']);
      }
      handler.next(options);
    },
    // onError: (error , handler) async{
    //   try {
    //     handler.resolve(error.response!);
    //   } catch (e) {
    //     return handler.next(error);
    //   }
    // },
  );
}
