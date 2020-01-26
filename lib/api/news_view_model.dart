import 'package:ncov_2019/api/news_model.dart';
import 'package:ncov_2019/http/view_model.dart';

TimeNewsViewModel timeNewsViewModel = new TimeNewsViewModel();

class TimeNewsViewModel extends ViewModel {
  /*
  * 按时间线获取事件
  * */
  Future<dynamic> getTimeNews() async {
    final data = await TimeNewsReqModel().data();

    List list = new List();

    data.forEach((json) => list.add(TimeNewsModel.fromJson(json)));

    return list;
  }
}
