import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:garrar/core/constants/api_end_points.dart';

class DioHelper {
  static BaseOptions opts = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl, responseType: ResponseType.json);

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

 static Future<Response?> postData(String url, Map<String, dynamic> data,
      Map<String, dynamic> headers) async {
    try {
      Response? response = await dio?.post(
        url,
        options: Options(headers: headers),
        data: data,
      );
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

 static Future<Response?> putData(String url, Map<String, dynamic> data) async {
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
