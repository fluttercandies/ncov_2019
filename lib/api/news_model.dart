import 'package:ncov_2019/http/req_model.dart';

class TimeNewsReqModel extends ReqModel {
  @override
  String url() => '/data/getTimelineService';

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 按时间线获取事件
* */
class TimeNewsModel {
  String summary;
  String sourceUrl;
  int modifyTime;
  int createTime;
  int id;
  String provinceName;
  String title;
  int pubDate;
  String pubDateStr;
  String provinceId;
  String infoSource;

  TimeNewsModel({
    this.summary,
    this.sourceUrl,
    this.modifyTime,
    this.createTime,
    this.id,
    this.provinceName,
    this.title,
    this.pubDate,
    this.pubDateStr,
    this.provinceId,
    this.infoSource,
  });

   TimeNewsModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    sourceUrl = json['sourceUrl'];
    modifyTime = json['modifyTime'];
    createTime = json['createTime'];
    id = json['id'];
    provinceName = json['provinceName'];
    title = json['title'];
    pubDate = json['pubDate'];
    pubDateStr = json['pubDateStr'];
    provinceId = json['provinceId'];
    infoSource = json['infoSource'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['sourceUrl'] = this.sourceUrl;
    data['modifyTime'] = this.modifyTime;
    data['createTime'] = this.createTime;
    data['id'] = this.id;
    data['provinceName'] = this.provinceName;
    data['title'] = this.title;
    data['pubDate'] = this.pubDate;
    data['pubDateStr'] = this.pubDateStr;
    data['provinceId'] = this.provinceId;
    data['infoSource'] = this.infoSource;
    return data;
  }
}
