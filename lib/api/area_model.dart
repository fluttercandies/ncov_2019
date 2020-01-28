import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 获取省份信息 - 请求
* */
class AreaReqModel extends ReqModel {
  @override
  String url() => API.getAreaStat;

  @override
  Map params() => {};

  Future data() => get();
}

class AreaModel {
  int confirmedCount;
  int curedCount;
  List<AreaModelCity> cities;
  String provinceShortName;
  String comment;
  String provinceName;
  int deadCount;
  int suspectedCount;

  AreaModel({this.confirmedCount, this.curedCount, this.cities, this.provinceShortName, this.comment, this.provinceName, this.deadCount, this.suspectedCount});

  AreaModel.fromJson(Map<String, dynamic> json) {
    confirmedCount = json['confirmedCount'];
    curedCount = json['curedCount'];
    if (json['cities'] != null) {
      cities = new List<AreaModelCity>();(json['cities'] as List).forEach((v) { cities.add(new AreaModelCity.fromJson(v)); });
    }
    provinceShortName = json['provinceShortName'];
    comment = json['comment'];
    provinceName = json['provinceName'];
    deadCount = json['deadCount'];
    suspectedCount = json['suspectedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmedCount'] = this.confirmedCount;
    data['curedCount'] = this.curedCount;
    if (this.cities != null) {
      data['cities'] =  this.cities.map((v) => v.toJson()).toList();
    }
    data['provinceShortName'] = this.provinceShortName;
    data['comment'] = this.comment;
    data['provinceName'] = this.provinceName;
    data['deadCount'] = this.deadCount;
    data['suspectedCount'] = this.suspectedCount;
    return data;
  }
}

class AreaModelCity {
  int confirmedCount;
  int curedCount;
  String cityName;
  int deadCount;
  int suspectedCount;

  AreaModelCity({this.confirmedCount, this.curedCount, this.cityName, this.deadCount, this.suspectedCount});

  AreaModelCity.fromJson(Map<String, dynamic> json) {
    confirmedCount = json['confirmedCount'];
    curedCount = json['curedCount'];
    cityName = json['cityName'];
    deadCount = json['deadCount'];
    suspectedCount = json['suspectedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmedCount'] = this.confirmedCount;
    data['curedCount'] = this.curedCount;
    data['cityName'] = this.cityName;
    data['deadCount'] = this.deadCount;
    data['suspectedCount'] = this.suspectedCount;
    return data;
  }
}
