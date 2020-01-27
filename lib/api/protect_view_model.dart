import 'package:ncov_2019/api/protect_model.dart';
import 'package:ncov_2019/commom/check.dart';
export 'package:ncov_2019/api/protect_model.dart';
import 'package:ncov_2019/http/view_model.dart';

ProtectViewModel protectViewModel = new ProtectViewModel();

class ProtectViewModel extends ViewModel {
  /*
  * 最新防护知识
  * */
  Future<dynamic> getData() async {
    final data = await ProtectReqModel().data();

    List list = new List();

    if (listNoEmpty(data)) {
      data.forEach((json) => list.add(ProtectModel.fromJson(json)));
    }

    return Future.value(list);
  }
}
