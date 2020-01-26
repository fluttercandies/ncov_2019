import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:ncov_2019/api/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ncov-2019',
      navigatorKey: navGK,
      theme: ThemeData(
        indicatorColor: Color(0xff4169e2),
      ),
      home: new MyHomePage(),
    );
  }
}

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
                HomeViewModel().testViewModel();
              },
            )
          ],
        ),
      ),
    );
  }
}
