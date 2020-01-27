import 'package:flutter/material.dart';
import 'package:ncov_2019/commom/commom.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      alignment: Alignment.centerLeft,
      width: winWidth(context),
      child: new FlatButton(
        onPressed: () {},
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              '这是文章的标题$index',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: new Text(
                '这是文章的概览啊$index这是文章的概览啊$index这是文章的概览啊$index这是文章的概览啊$index这是文章的概览啊$index这是文章的概览啊$index这是文章的概览啊$index是文章的概览啊$index这是文章的概览啊$index是文章的概览啊$index这是文章的概览啊$index',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xff999999), fontSize: 12.0),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '地区：北京',
                  style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
                ),
                new Text(
                  '来源：人民日报',
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
