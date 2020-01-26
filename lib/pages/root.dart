import 'package:flutter/material.dart';
import 'package:ncov_2019/api/news_view_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            new MaterialButton(
              child: new Text('测试请求'),
              onPressed: () {
                timeNewsViewModel.getTimeNews();
              },
            )
          ],
        ),
      ),
    );
  }
}
