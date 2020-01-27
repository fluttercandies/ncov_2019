import 'package:flutter/material.dart';
import 'package:ncov_2019/api/news_model.dart';
import 'package:ncov_2019/commom/commom.dart';

class NewsCard extends StatelessWidget {
  final TimeNewsModel model;

  NewsCard(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      alignment: Alignment.centerLeft,
      width: winWidth(context),
      child: new FlatButton(
        onPressed: () {},
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              '${model?.title ?? '未知'}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                  '地区：${model?.provinceName ?? '未知'}',
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
