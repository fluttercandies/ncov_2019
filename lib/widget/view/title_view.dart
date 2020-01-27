import 'package:flutter/material.dart';
import 'package:ncov_2019/commom/commom.dart';

class TitleView extends StatelessWidget {
  final String title;

  TitleView(this.title);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: appBarColor,
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
          width: 5.0,
          height: 15.0,
        ),
        new Space(width: 10.0),
        new Text(
          '$title',
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
