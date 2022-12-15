import 'dart:developer';
import 'dart:io';

import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:http/http.dart' as http;

class HttpCalls {
  final String _apiEndPoint = '';

  errorHandle(response) {
    if (response.statusCode == 500) {}
  }

  Future<http.Response> postWithParams(String api, dynamic params) async {
    String reqUrl = _apiEndPoint + api;

    http.Response response;
    if (PreferencesHelper.getToken() != '') {
      response = await http.post(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}",
        },
      );
    } else {
      response = await http.post(
        Uri.parse(reqUrl),
        body: params,
        headers: {},
      );
    }

    errorHandle(response);
    return response;
  }

  Future<http.Response> postWithJsonParams(String api, dynamic params) async {
    String reqUrl = _apiEndPoint + api;
    log(params);
    http.Response response;
    if (PreferencesHelper.getToken() != '') {
      response = await http.post(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}",
          "Content-Type": "application/json"
        },
      );
    } else {
      response = await http.post(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          "Content-Type": "application/json",
        },
      );
    }
    errorHandle(response);
    return response;
  }

  Future<http.Response> getWithParams(
      {required String api, required Map<String, dynamic> params}) async {
    String reqUrl = "$_apiEndPoint$api?";
    params.forEach((key, val) {
      if (val != null) {
        reqUrl += '${"$key=" + val}&';
      }
    });
    http.Response response;

    if (PreferencesHelper.getToken() != '') {
      response = await http.get(
        Uri.parse(reqUrl),
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}"
        },
      );
    } else {
      response = await http.get(
        Uri.parse(reqUrl),
        headers: {},
      );
    }

    errorHandle(response);
    log(response.body);
    return response;
  }

  Future<http.Response> getParams(
      {required String api, required Map<String, dynamic> params}) async {
    String endPoint = _apiEndPoint;
    String reqUrl = "$endPoint$api?";
    params.forEach((key, val) {
      if (val != null) {
        reqUrl += "$key=$val&";
      }
    });
    http.Response response;

    String token = PreferencesHelper.getToken();
    if (token.isNotEmpty) {
      response = await http.get(
        Uri.parse(reqUrl),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          "Content-Type": "application/json"
        },
      );
    } else {
      response = await http.get(
        Uri.parse(reqUrl),
        headers: {"Content-Type": "application/json"},
      );
    }

    errorHandle(response);
    // log(response.body);
    return response;
  }

  Future<http.Response> putWithParams(
      String api, Map<String, dynamic> params) async {
    String reqUrl = _apiEndPoint + api;
    http.Response response;
    if (PreferencesHelper.getToken() != '') {
      response = await http.put(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}"
        },
      );
    } else {
      response = await http.put(
        Uri.parse(reqUrl),
        body: params,
        headers: {},
      );
    }
    errorHandle(response);
    return response;
  }

  Future<http.Response> putWithJsonParams(String api, dynamic params) async {
    String reqUrl = _apiEndPoint + api;
    http.Response response;

    log(params);
    if (PreferencesHelper.getToken() != '') {
      response = await http.put(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}",
          "Content-Type": "application/json"
        },
      );
    } else {
      response = await http.put(
        Uri.parse(reqUrl),
        body: params,
        headers: {},
      );
    }
    errorHandle(response);
    return response;
  }

  Future<http.Response> deleteWithParams(String api, dynamic params) async {
    String reqUrl = _apiEndPoint + api;

    http.Response response;
    if (PreferencesHelper.getToken() != '') {
      response = await http.delete(
        Uri.parse(reqUrl),
        body: params,
        headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${PreferencesHelper.getToken()}",
        },
      );
    } else {
      response = await http.delete(
        Uri.parse(reqUrl),
        body: params,
        headers: {},
      );
    }
    errorHandle(response);
    return response;
  }
}
