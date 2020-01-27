import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 最新知识百科 - 请求
* */
class LoreReqModel extends ReqModel {
  @override
  String url() => API.getWikiList;

  @override
  Map params() => {};

  Future data() => get();
}

class LoreModel {
  String imgUrl;
  String linkUrl;
  String description;
  int id;
  int sort;
  String title;

  LoreModel({this.imgUrl, this.linkUrl, this.description, this.id, this.sort, this.title});

  LoreModel.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    linkUrl = json['linkUrl'];
    description = json['description'];
    id = json['id'];
    sort = json['sort'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['linkUrl'] = this.linkUrl;
    data['description'] = this.description;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['title'] = this.title;
    return data;
  }
}
