import 'package:ncov_2019/http/req.dart';

class HomeViewModel extends Req {
  @override
  String url() => 'https://www.wanandroid.com/user/login';

  test() {
    post().then((v) {
      print('拿到值：$v');
    });
  }
}
