import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/config/config.dart';

// 请求计数
var _id = 0;

/*
* 请求类型枚举
* */
enum RequestType { GET, POST }

class ReqModel {
  // 请求url路径
  String url() => null;

  // 请求参数
  Map params() => {};

  /*
  * get请求
  * */
  Future<dynamic> get() async {
    return this._request(
      url: url(),
      method: RequestType.GET,
      params: params(),
    );
  }

  /*
  * post请求
  * */
  Future post() async {
    return this._request(
      url: url(),
      method: RequestType.POST,
      params: params(),
    );
  }

  /*
  * post请求-文件上传方式
  * */
  Future postUpload(
    ProgressCallback progressCallBack, {
    FormData formData,
  }) async {
    return this._request(
      url: url(),
      method: RequestType.POST,
      formData: formData,
      progressCallBack: progressCallBack,
      params: params(),
    );
  }

  /*
  * 请求方法
  * */
  Future _request({
    String url,
    RequestType method,
    Map params,
    FormData formData,
    ProgressCallback progressCallBack,
  }) async {
    Dio _client;

    final httpUrl = '${API.reqUrl}$url';

    if (_client == null) {
      BaseOptions options = new BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeOut;
      options.headers = const {'Content-Type': 'application/json'};
      options.baseUrl = API.reqUrl;
      _client = new Dio(options);
    }

    final id = _id++;
    int statusCode;
    try {
      Response response;
      if (method == RequestType.GET) {
        ///组合GET请求的参数
        if (mapNoEmpty(params)) {
          response = await _client.get(
            url,
            queryParameters: params,
          );
        } else {
          response = await _client.get(
            url,
          );
        }
      } else {
        if (mapNoEmpty(params) && formData.isNotEmpty) {
          response = await _client.post(
            url,
            data: formData ?? params,
            onSendProgress: progressCallBack,
          );
        } else {
          response = await _client.post(
            url,
          );
        }
      }

      statusCode = response.statusCode;

      if (response != null) {
        print('HTTP_REQUEST_URL::[$id]::$httpUrl');
        if (mapNoEmpty(params)) {
          print('HTTP_REQUEST_BODY::[$id]::${json.encode(params)}');
        }
        print('HTTP_RESPONSE_BODY::[$id]::${json.encode(response.data)}');
        return response.data;
      }

      ///处理错误部分
      if (statusCode < 0) {
        return _handError(statusCode);
      }
    } catch (e) {
      return _handError(statusCode);
    }
  }

  ///处理异常
  static Future _handError(int statusCode) {
    String errorMsg = 'Network request error';
    Map errorMap = {"errorMsg": errorMsg, "errorCode": statusCode};

    print("HTTP_RESPONSE_ERROR::$errorMsg code:$statusCode");
    return Future.value(errorMap);
  }
}
