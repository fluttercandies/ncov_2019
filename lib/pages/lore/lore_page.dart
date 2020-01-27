import 'package:flutter/material.dart';
import 'package:ncov_2019/widget/bar/commom_bar.dart';

class LorePage extends StatefulWidget {
  @override
  _LorePageState createState() => _LorePageState();
}

class _LorePageState extends State<LorePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ComMomBar(title: 'LorePage'),
    );
  }
}
