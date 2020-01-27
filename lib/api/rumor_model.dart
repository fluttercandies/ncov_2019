import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 最新辟谣 - 请求
* */
class RumorListReqModel extends ReqModel {
  @override
  String url() => API.getIndexRumorList;

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 最新辟谣 - 响应
*
* @param id 事件Id
* @param title 标题
* @param mainSummary 辟谣方
* @param summary 概要
* @param sourceUrl 原文Url
* @param body 详情
* @param rumorType 谣言类型
* */
class RumorListModel {
  String summary;
  String sourceUrl;
  int score;
  int rumorType;
  int id;
  String mainSummary;
  String title;
  String body;
  bool isOpen;

  RumorListModel({
    this.summary,
    this.sourceUrl,
    this.score,
    this.rumorType,
    this.id,
    this.mainSummary,
    this.title,
    this.body,
    this.isOpen = false,
  });

  RumorListModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    sourceUrl = json['sourceUrl'];
    score = json['score'];
    rumorType = json['rumorType'];
    id = json['id'];
    mainSummary = json['mainSummary'];
    title = json['title'];
    body = json['body'];
    isOpen = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['sourceUrl'] = this.sourceUrl;
    data['score'] = this.score;
    data['rumorType'] = this.rumorType;
    data['id'] = this.id;
    data['mainSummary'] = this.mainSummary;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
