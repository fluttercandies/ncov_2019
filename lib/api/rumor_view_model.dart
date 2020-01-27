import 'package:ncov_2019/api/rumor_model.dart';
export 'package:ncov_2019/api/rumor_model.dart';
import 'package:ncov_2019/http/view_model.dart';

RumorListReqViewModel rumorListReqViewModel = new RumorListReqViewModel();

class RumorListReqViewModel extends ViewModel {
  /*
  * 最新辟谣
  * */
  Future<dynamic> getRumor() async {
    final data = await RumorListReqModel().data();

    List list = new List();

    data.forEach((json) => list.add(RumorListModel.fromJson(json)));

    return Future.value(list);
  }
}
