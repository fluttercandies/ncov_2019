import 'dart:convert';

import 'package:ncov_2019/api/lore_model.dart';
import 'package:ncov_2019/commom/commom.dart';
export 'package:ncov_2019/api/lore_model.dart';
import 'package:ncov_2019/http/view_model.dart';

LoreViewModel loreViewModel = new LoreViewModel();

class LoreViewModel extends ViewModel {
  /*
  * 最新知识百科
  * */
  Future<dynamic> getLore() async {
    List data;
    List list = new List();

    LoreReqModel().data().then((map) async {
      data = map['result'];

      if (listNoEmpty(data)) {
        data.forEach((json) => list.add(LoreModel.fromJson(json)));
        SharedUtil.instance.saveString('loreData', jsonEncode(map).toString());
        final strData = await SharedUtil.instance.getString('loreData');
        print('我存好了数据：${strData.toString()}');
      }

      return Future.value(list);
    });

    /// 无网络状态下的处理
    subscription.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        final strData = await SharedUtil.instance.getString('loreData');
        final listData = json.decode(strData);
        if (listNoEmpty(listData['result'])) {
          listData['result']
              .forEach((json) => list.add(LoreModel.fromJson(json)));
        }
      }
    });

    return Future.value(list);
  }
}
