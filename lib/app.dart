import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:ncov_2019/config/config.dart';
import 'package:ncov_2019/pages/root/root_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      navigatorKey: navGK,
      theme: ThemeData(
        indicatorColor: Color(0xff4169e2),
      ),
      home: new RootPage(),
    );
  }
}
