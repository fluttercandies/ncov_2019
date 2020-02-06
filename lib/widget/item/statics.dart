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

  Color iconColor(String label) {
    switch (label) {
      case '传染源':
        return Colors.blueAccent;
        break;
      case '病毒':
        return Colors.blueAccent;
        break;
      case '传播途径':
        return Colors.blueAccent;
        break;
      default:
        return Colors.red;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (statisticsModel == null) {
      return LinearProgressIndicator();
    }

    List personInfo = [
      {'label': '全国确诊', 'value': '${statisticsModel?.confirmedCount ?? 0}'},
      {'label': '疑似病例', 'value': '${statisticsModel?.suspectedCount ?? 0}'},
      {'label': '治愈人数', 'value': '${statisticsModel?.curedCount ?? 0}'},
      {'label': '死亡人数', 'value': '${statisticsModel?.deadCount ?? 0}'},
    ];

    bool contains1Big = statisticsModel.remark1.contains('：');
    bool contains1Small = statisticsModel.remark1.contains(':');
    bool containsOr = contains1Big || contains1Small;
    Pattern splitStr = contains1Big ? '：' : ':';

    List note1 = strNoEmpty(statisticsModel?.note1) && containsOr
        ? statisticsModel.note1.split(splitStr)
        : ['未知', '未知'];
    List note2 = strNoEmpty(statisticsModel?.note2) && containsOr
        ? statisticsModel.note2.split(splitStr)
        : ['未知', '未知'];
    List note3 = strNoEmpty(statisticsModel?.note3) && containsOr
        ? statisticsModel.note3.split(splitStr)
        : ['未知', '未知'];
    List remark1 = strNoEmpty(statisticsModel?.remark1) && containsOr
        ? statisticsModel.remark1.split(splitStr)
        : ['未知', '未知'];
    List remark2 = strNoEmpty(statisticsModel?.remark2) && containsOr
        ? statisticsModel.remark2.split(splitStr)
        : ['未知', '未知'];

    List staticsInfo = [
      {'label': '${note1[0]}', 'value': '${note1[1]}'},
      {'label': '${note2[0]}', 'value': '${note2[1]}'},
      {'label': '${note3[0]}', 'value': '${note3[1]}'},
      {'label': '${remark1[0]}', 'value': '${remark1[1]}'},
      {'label': '${remark2[0]}', 'value': '${remark2[1]}'},
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
            new Visibility(
              visible: model.label != '传染源',
              child: new Space(),
            ),
            new SizedBox(
              width: 120,
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.insert_chart,
                    color: iconColor(model.label),
                  ),
                  new Space(width: mainSpace / 2),
                  new Text('${model.label}：', style: defStyle),
                ],
              ),
            ),
            new Text(
              '  ·  ${model.value}',
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
