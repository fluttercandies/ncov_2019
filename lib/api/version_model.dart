import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 版本更新 - 请求
* */
class VersionReqModel extends ReqModel {
  @override
  String url() => API.update;

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 版本更新 - 响应
* */
class VersionModel {
  String updateInfo;
  String appVersion;
  String appName;
  String appId;
  String downloadUrl;
  bool force;
  int appVersionCode;

  VersionModel({this.updateInfo, this.appVersion, this.appName, this.appId, this.downloadUrl, this.force, this.appVersionCode});

  VersionModel.fromJson(Map<String, dynamic> json) {
    updateInfo = json['updateInfo'];
    appVersion = json['appVersion'];
    appName = json['appName'];
    appId = json['appId'];
    downloadUrl = json['downloadUrl'];
    force = json['force'];
    appVersionCode = json['appVersionCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateInfo'] = this.updateInfo;
    data['appVersion'] = this.appVersion;
    data['appName'] = this.appName;
    data['appId'] = this.appId;
    data['downloadUrl'] = this.downloadUrl;
    data['force'] = this.force;
    data['appVersionCode'] = this.appVersionCode;
    return data;
  }
}
