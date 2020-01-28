import 'package:ncov_2019/api/area_model.dart';
import 'package:ncov_2019/commom/commom.dart';
export 'package:ncov_2019/api/area_model.dart';
import 'package:ncov_2019/http/view_model.dart';

AreaViewModel areaViewModel = new AreaViewModel();

class AreaViewModel extends ViewModel {
  /*
  * 获取省份信息
  * */
  Future<dynamic> getData() async {
    final data = await AreaReqModel().data();


    List list = new List();

    if (listNoEmpty(data)) {
      data.forEach((json) => list.add(AreaModel.fromJson(json)));
    }

    return Future.value(list);
  }
}
