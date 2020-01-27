import 'package:flutter/material.dart';
import 'package:ncov_2019/widget/bar/commom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new ComMomBar(title: 'home'),
      ),
    );
  }
}
