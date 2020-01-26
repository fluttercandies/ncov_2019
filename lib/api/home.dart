import 'package:ncov_2019/api/home_model.dart';

class HomeViewModel {
  Future testViewModel() async {
    HomeModel().data().then(
          (v) {},
        );
  }
}
