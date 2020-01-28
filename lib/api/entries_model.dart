import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 诊疗信息 - 请求
* */
class EntriesReqModel extends ReqModel {
  @override
  String url() => API.getEntries;

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 诊疗信息 - 响应
* */
class EntriesModel {
  String configName;
  String imgUrl;
  int configNo;
  String linkUrl;
  String icon;
  int id;

  EntriesModel(
      {this.configName, this.imgUrl, this.configNo, this.linkUrl, this.id});

  EntriesModel.fromJson(Map<String, dynamic> json) {
    configName = json['configName'];
    imgUrl = json['imgUrl'];
    configNo = json['configNo'];
    linkUrl = json['linkUrl'];
    id = json['id'];
    icon = 'assets/images/entries_$id.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['configName'] = this.configName;
    data['imgUrl'] = this.imgUrl;
    data['configNo'] = this.configNo;
    data['linkUrl'] = this.linkUrl;
    data['id'] = this.id;
    return data;
  }
}
