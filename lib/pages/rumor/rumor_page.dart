import 'package:flutter/material.dart';
import 'package:ncov_2019/widget/bar/commom_bar.dart';

class RumorPage extends StatefulWidget {
  @override
  _RumorPageState createState() => _RumorPageState();
}

class _RumorPageState extends State<RumorPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new ComMomBar(title: 'RumorPage'),
      ),
    );
  }
}
