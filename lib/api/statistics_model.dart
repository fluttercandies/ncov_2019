import 'package:ncov_2019/config/api.dart';
import 'package:ncov_2019/http/req_model.dart';

/*
* 获取整体统计信息 - 请求
* */
class StatisticsReqModel extends ReqModel {
  @override
  String url() => API.getStatisticsService;

  @override
  Map params() => {};

  Future data() => get();
}

/*
* 获取整体统计信息 - 响应
* */
class StatisticsModel {
  String summary;
  String generalRemark;
  int curedCount;
  String abroadRemark;
  String virus;
  int suspectedCount;
  String imgUrl;
  int confirmedCount;
  String infectSource;
  int modifyTime;
  bool deleted;
  String passWay;
  int createTime;
  String remark5;
  String dailyPic;
  String remark4;
  int id;
  String countRemark;
  int deadCount;
  String remark1;
  String remark3;
  String remark2;

  StatisticsModel({
    this.summary,
    this.generalRemark,
    this.curedCount,
    this.abroadRemark,
    this.virus,
    this.suspectedCount,
    this.imgUrl,
    this.confirmedCount,
    this.infectSource,
    this.modifyTime,
    this.deleted,
    this.passWay,
    this.createTime,
    this.remark5,
    this.dailyPic,
    this.remark4,
    this.id,
    this.countRemark,
    this.deadCount,
    this.remark1,
    this.remark3,
    this.remark2,
  });

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    generalRemark = json['generalRemark'];
    curedCount = json['curedCount'];
    abroadRemark = json['abroadRemark'];
    virus = json['virus'];
    suspectedCount = json['suspectedCount'];
    imgUrl = json['imgUrl'];
    confirmedCount = json['confirmedCount'];
    infectSource = json['infectSource'];
    modifyTime = json['modifyTime'];
    deleted = json['deleted'];
    passWay = json['passWay'];
    createTime = json['createTime'];
    remark5 = json['remark5'];
    dailyPic = json['dailyPic'];
    remark4 = json['remark4'];
    id = json['id'];
    countRemark = json['countRemark'];
    deadCount = json['deadCount'];
    remark1 = json['remark1'];
    remark3 = json['remark3'];
    remark2 = json['remark2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['generalRemark'] = this.generalRemark;
    data['curedCount'] = this.curedCount;
    data['abroadRemark'] = this.abroadRemark;
    data['virus'] = this.virus;
    data['suspectedCount'] = this.suspectedCount;
    data['imgUrl'] = this.imgUrl;
    data['confirmedCount'] = this.confirmedCount;
    data['infectSource'] = this.infectSource;
    data['modifyTime'] = this.modifyTime;
    data['deleted'] = this.deleted;
    data['passWay'] = this.passWay;
    data['createTime'] = this.createTime;
    data['remark5'] = this.remark5;
    data['dailyPic'] = this.dailyPic;
    data['remark4'] = this.remark4;
    data['id'] = this.id;
    data['countRemark'] = this.countRemark;
    data['deadCount'] = this.deadCount;
    data['remark1'] = this.remark1;
    data['remark3'] = this.remark3;
    data['remark2'] = this.remark2;
    return data;
  }
}
