import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';

class APICore {
  String apiHost = "https://api.sebekvpn.app";

  dynamic jsonDecodeUtf8(bodyBytes, {String? key}) async {
    var unescape = HtmlUnescape();
    String data = utf8.decode(bodyBytes);
    String htmlDecoded = unescape.convert(data);

    // if (key != null) {
    //   await UserSharedStorage.setAPICache(key, htmlDecoded);
    // }

    return jsonDecode(htmlDecoded);
  }

  sendRequest({
    required String endpoint,
    required String method,
    var body = const {},
    bool auth = false,
  }) async {
    var token = UserSharedStorage.getToken();
    var url = Uri.parse('$apiHost$endpoint');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': auth ? "Bearer $token" : '',
    };
    var response;
    if (method == 'post') {
      response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    } else if (method == 'put') {
      response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    } else if (method == 'patch') {
      response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    } else if (method == 'delete') {
      response = await http.delete(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
    } else {
      response = await http.get(
        url,
        headers: headers,
      );
    }
    print('$apiHost$endpoint');
    print(response.body);
    return jsonDecodeUtf8(response.bodyBytes);
  }

  firebase(Map data) async {
    var response = await sendRequest(
      endpoint: "/api/user/firebase/",
      method: "patch",
      body: data,
      auth: true,
    );
    return response;
  }

  session() async {
    var response = await sendRequest(
      endpoint: '/api/auth/session/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  getServers() async {
    var response = await sendRequest(
      endpoint: '/api/server/servers/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  getPersonalServers() async {
    var response = await sendRequest(
      endpoint: '/api/server/personal_servers/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  getUserPersonalServers() async {
    var response = await sendRequest(
      endpoint: '/api/server/user_personal_servers/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  getCredentials(Server server) async {
    var response = await sendRequest(
      endpoint:
          '/api/server/get_credentials/?server_id=${server.id}&is_personal=${server.isPersonal}',
      method: 'get',
      auth: true,
    );
    return response;
  }

  changeSettings(data) async {
    var response = await sendRequest(
      endpoint: '/api/user/change_settings/',
      method: 'patch',
      auth: true,
      body: data,
    );
    return response;
  }

  deleteAccount() async {
    var response = await sendRequest(
      endpoint: '/api/user/delete/',
      method: 'delete',
      auth: true,
    );
    return response;
  }

  changePassword(password) async {
    var response = await sendRequest(
      endpoint: '/api/user/change_password/?password=$password',
      method: 'patch',
      auth: true,
    );
    return response;
  }

  recoverPassword(email, code, password) async {
    var response = await sendRequest(
      endpoint: "/api/auth/password_recovery_confirm/?email=$email&code=$code&password=$password",
      method: "post",
    );
    return response;
  }

  getNotifications() async {
    var response = await sendRequest(
      endpoint: '/api/user/notifications/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  settings() async {
    var response = await sendRequest(
      endpoint: '/api/base/settings/',
      method: 'get',
      auth: true,
    );
    return response;
  }

  subscription() async {
    var response = await sendRequest(
      endpoint: '/api/payment/info/',
      method: 'get',
      auth: true,
    );
    return response;
  }
}
