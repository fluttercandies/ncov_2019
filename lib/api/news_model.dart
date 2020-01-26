import 'package:ncov_2019/http/req_model.dart';

/*
* 按时间线获取事件 - 请求
* */
class TimeNewsReqModel extends ReqModel {
  @override
  String url() => '/data/getTimelineService';

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 按时间线获取事件 - 响应
*
* @param summary 概要
* @param sourceUrl 原文Url
* @param modifyTime 更新时间
* @param createTime 创建时间
* @param id 事件Id
* @param provinceName 省份名称
* @param title 标题
* @param pubDate 发布日期时间戳
* @param pubDateStr 发布日期文本
* @param provinceId 地区编号
* @param infoSource 信息来源
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
