import 'dart:convert';

import 'package:ncov_2019/http/req.dart';

class HomeModel extends Req {
  @override
  String url() => 'http://49.232.173.220:3001/data/getTimelineService';

//  final String text;
//
//  HomeModel({this.text = '暂无数据'});
  //  @override
//  Map params() => {};

  Future data()  {
//    print('调用data::');
//    HomeModel model =this;
//        var requstBody = jsonDecode(jsonEncode(model));
//    print('调用data:::${requstBody.keys}');
    return get();
  }
}
