import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';

class DioHelper {
  static const String url = 'BASE_URL';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    headers: {'token': 'Oauth ${PreferencesHelper.getToken()}'},
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio init() {
    return Dio(opts);
  }

  static Dio? dio = init();

  Future<Response?> getData(String url) async {
    try {
      Response? response = await dio?.get(url);
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<Response?> postData(String url, Map<String, dynamic> data) async {
    try {
      Response? response = await dio?.post(url, data: data);
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<Response?> putData(String url, Map<String, dynamic> data) async {
    try {
      Response? response = await dio?.put(url, data: data);
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<Response?> deleteData(String url) async {
    try {
      Response? response = await dio?.delete(url);
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
