import 'package:flutter/material.dart';
import 'package:ncov_2019/commom/commom.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: winWidth(context),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(),
          new Space(),
          new Text(
            '加载中',
            style: TextStyle(color: mainTextColor),
          ),
        ],
      ),
    );
  }
}
