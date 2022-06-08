import 'package:batch28_api_starter/api/HTTPServices.dart';
import 'package:batch28_api_starter/model/UserModel.dart';
import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HTTPServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> loginUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + loginUrl;
    var dio = HTTPServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
