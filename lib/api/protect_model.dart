import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 最新防护知识 - 请求
* */
class ProtectReqModel extends ReqModel {
  @override
  String url() => API.getIndexRecommendList;

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 最新防护知识 - 响应
*
* @param imgUrl 封面图片
* @param modifyTime 修改时间
* @param recordStatus 记录状态
* @param createTime 创建时间
* @param id 事件Id
* @param linkUrl 链接url
* @param title 标题
* @param sort 分类
* @param contentType 内容类型
* @param xOperator X操作符
* */
class ProtectModel {
  String imgUrl;
  int modifyTime;
  int recordStatus;
  int createTime;
  String linkUrl;
  int id;
  int sort;
  String title;
  int contentType;
  String xOperator;

  ProtectModel({this.imgUrl, this.modifyTime, this.recordStatus, this.createTime, this.linkUrl, this.id, this.sort, this.title, this.contentType, this.xOperator});

  ProtectModel.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    modifyTime = json['modifyTime'];
    recordStatus = json['recordStatus'];
    createTime = json['createTime'];
    linkUrl = json['linkUrl'];
    id = json['id'];
    sort = json['sort'];
    title = json['title'];
    contentType = json['contentType'];
    xOperator = json['operator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['modifyTime'] = this.modifyTime;
    data['recordStatus'] = this.recordStatus;
    data['createTime'] = this.createTime;
    data['linkUrl'] = this.linkUrl;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['title'] = this.title;
    data['contentType'] = this.contentType;
    data['operator'] = this.xOperator;
    return data;
  }
}
