import 'package:flutter/material.dart';
import 'package:ncov_2019/api/news_model.dart';
import 'package:ncov_2019/commom/commom.dart';

class NewsCard extends StatelessWidget {
  final TimeNewsModel model;
  final EdgeInsetsGeometry padding;
  final bool isNew;

  NewsCard(
    this.model, {
    @required this.padding,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    double createTimeDouble =
        strNoEmpty('${model?.createTime}') ? model.createTime / 1000 : 0;
    int createTime = int.parse('${stringDisposeWithDouble(createTimeDouble)}');
    bool isTimeStr =
        DateTime.now().millisecondsSinceEpoch - model?.createTime < 86400000;
    return Container(
      padding: padding,
      alignment: Alignment.centerLeft,
      width: winWidth(context),
      child: new FlatButton(
        onPressed: () => routePush(
          new WebViewPage(model?.sourceUrl ?? 'http://book.flutterj.com/',
              '${model?.title ?? '未知'}'),
        ),
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Visibility(
                  visible: isNew,
                  child: new Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 3.0),
                    margin: EdgeInsets.only(right: 5.0),
                    child: new Text(
                      '最新',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                new Text(
                  '${model?.title ?? '未知'}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: new Text(
                '${model?.summary ?? '未知'}',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xff999999), fontSize: 12.0),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '时间：${isTimeStr ? model?.pubDateStr ?? '未知' : formatTimeStampToString(createTime) ?? '未知'}',
                  style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
                ),
                new Text(
                  '来源：${model?.infoSource ?? '未知'}',
                  style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
