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

  static TextStyle defStyle =
      TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    List personInfo = [
      {'label': '全国确诊', 'value': '${statisticsModel?.confirmedCount ?? 0}'},
      {'label': '疑似病例', 'value': '${statisticsModel?.suspectedCount ?? 0}'},
      {'label': '治愈人数', 'value': '${statisticsModel?.curedCount ?? 0}'},
      {'label': '死亡人数', 'value': '${statisticsModel?.deadCount ?? 0}'},
    ];

    List remark1 = statisticsModel?.remark1 ?? '未知key:未知'.split(':');

    List staticsInfo = [
      {'label': '传染源', 'value': '${statisticsModel?.infectSource ?? '未知'}'},
      {'label': '病毒', 'value': '${statisticsModel?.virus ?? '未知'}'},
      {'label': '传播途径', 'value': '${statisticsModel?.passWay ?? '未知'}'},
      {'label': '${remark1[0]}', 'value': '${remark1[1]}'},
      {'label': '潜伏期', 'value': '${statisticsModel?.remark2 ?? '未知'}'},
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

    Widget _staticsBuild(item) {
      PersonInfoModel model = PersonInfoModel(item);

      return new SizedBox(
        width: winWidth(context) - 20,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              width: 120,
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.insert_chart),
                  new Space(width: mainSpace / 2),
                  new Text('${model.label}：', style: defStyle),
                ],
              ),
            ),
            new Text(
              '${model.value}',
              style: defStyle,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.only(top: 10.0),
          child: new Row(
            children: personInfo.map(itemBuild).toList(),
          ),
        ),
        new Divider(),
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: new Column(
            children: staticsInfo.map(_staticsBuild).toList(),
          ),
        )
      ],
    );
  }
}

class PersonInfoModel {
  String label;
  String value;

  PersonInfoModel(Map value) {
    this.label = value['label'];
    this.value = value['value'];
  }
}
