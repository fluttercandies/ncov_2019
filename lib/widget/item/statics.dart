import 'package:flutter/material.dart';
import 'package:ncov_2019/api/statistics_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';

class Statics extends StatelessWidget {
  final StatisticsModel statisticsModel;

  Statics(this.statisticsModel);

  Color strColor(name) {
    switch (name) {
      case '全国确诊':
        return Colors.red;
        break;
      case '疑似病例':
        return Colors.amber;
        break;
      case '治愈人数':
        return Colors.green;
        break;
      case '死亡人数':
        return Colors.grey;
        break;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    List personInfo = [
      {'label': '全国确诊', 'value': '${statisticsModel?.confirmedCount ?? 0}'},
      {'label': '疑似病例', 'value': '${statisticsModel?.suspectedCount ?? 0}'},
      {'label': '治愈人数', 'value': '${statisticsModel?.curedCount ?? 0}'},
      {'label': '死亡人数', 'value': '${statisticsModel?.deadCount ?? 0}'},
    ];

    Widget itemBuild(item) {
      PersonInfoModel model = PersonInfoModel(item);
      return FlatButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: new SizedBox(
          width: (winWidth(context) - 20) / 4,
          child: new Column(
            children: <Widget>[
              new Text(
                '${model.value}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: strColor(model.label),
                ),
              ),
              new Text(
                '${model.label}',
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 5.0),
      child: new Row(
        children: personInfo.map(itemBuild).toList(),
      ),
    );
  }
}

class PersonInfoModel {
  String label;
  String value;

  PersonInfoModel(Map value){
    this.label = value['label'];
    this.value = value['value'];
  }
}
