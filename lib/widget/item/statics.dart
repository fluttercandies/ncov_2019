import 'package:flutter/material.dart';
import 'package:ncov_2019/api/statistics_view_model.dart';

class Statics extends StatelessWidget {
  final StatisticsModel statisticsModel;

  Statics(this.statisticsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 5.0),
      child: new Text('传染源：${statisticsModel.infectSource}'),
    );
  }
}
