import 'package:dio/dio.dart';
import 'package:ncov_2019/commom/commom.dart';

var _id = 0;

typedef OnData(t);
typedef OnError(String msg, int code);

enum RequestType { GET, POST }

class Req {
  ///连接超时时间为5秒
  static const int connectTimeOut = 5 * 1000;

  ///响应超时时间为7秒
  static const int receiveTimeOut = 7 * 1000;


  String url() => null;

  ///get请求
  Future get({
    Map<String, String> params,
  }) async {
    return this._request(
      method: RequestType.GET,
      params: params,
    );
  }

  //post请求
  Future post({
    Map<String, String> params,
  }) async {
    return this._request(
      method: RequestType.POST,
      params: params,
    );
  }

  //post请求
  Future postUpload(
    ProgressCallback progressCallBack, {
    FormData formData,
  }) async {
    return this._request(
      method: RequestType.POST,
      formData: formData,
      progressCallBack: progressCallBack,
    );
  }

  Future _request({
    RequestType method,
    Map<String, String> params,
    FormData formData,
    ProgressCallback progressCallBack,
  }) async {
    Dio _client;

    if (_client == null) {
      BaseOptions options = new BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeOut;
      _client = new Dio(options);
    }

    final id = _id++;
    int statusCode;
    try {
      Response response;
      print('进入请求啊啊啊');
      if (method == RequestType.GET) {
        print('进入请求get');
        ///组合GET请求的参数
        if (mapNoEmpty(params)) {
          response = await _client.get(url(),
              queryParameters: params, );
        } else {
          response = await _client.get(url(), );
        }
      } else {
        print('进入请求');
        if (mapNoEmpty(params) && formData.isNotEmpty) {
          response = await _client.post(
            url(),
            data: formData ?? params,
            onSendProgress: progressCallBack,
          );
        } else {
          response = await _client.post(url(), );
        }
      }

      statusCode = response.statusCode;

      if (response != null) {
        print('HTTP_REQUEST_URL::[$id]::$url');
        print('HTTP_REQUEST_BODY::[$id]::${params ?? ' no'}');
        print('HTTP_RESPONSE_BODY::[$id]::${response.data}');
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
