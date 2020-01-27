import 'package:ncov_2019/commom/data/store.dart';
export 'package:ncov_2019/commom/data/store.dart';

class NCOVActions {
  static String msg() => 'msg';

  static String voiceImg() => 'voiceImg';
}

class Data {
  static String msg() => Store(NCOVActions.msg()).value = '';

  static String voiceImg() => Store(NCOVActions.voiceImg()).value = '';
}
