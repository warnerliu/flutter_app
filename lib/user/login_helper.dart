import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/network_config.dart';
import 'package:flutter_app/user/user_info.dart';

class LoginHelper {
  Future<User> asyncLogin(String account, String password) async {
    Dio dio = new Dio();
    Response response =
        await dio.post(NetworkConfig.BASE_URL + "/login", data: {
      'userAccount': account,
      'password': password,
    });
    // 网络json的处理竟然要这么处理。。。
    Map<String, dynamic> jsonString = jsonDecode(response.toString());
    User user = new User.fromJson(jsonString);
    return user;
  }
}
