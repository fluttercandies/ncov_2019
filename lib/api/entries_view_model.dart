import 'package:ncov_2019/api/entries_model.dart';
export 'package:ncov_2019/api/entries_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/http/view_model.dart';

EntriesViewModel entriesViewModel = new EntriesViewModel();

class EntriesViewModel extends ViewModel {
  /*
  * 诊疗信息
  * */
  Future<dynamic> getData() async {
    final data = await EntriesReqModel().data();

    List list = new List();

    if (listNoEmpty(data)) {
      data.forEach((json) => list.add(EntriesModel.fromJson(json)));
    }

    return Future.value(list);
  }
}
