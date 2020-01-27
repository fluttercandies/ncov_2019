import 'package:flutter/material.dart';
import 'package:ncov_2019/widget/bar/commom_bar.dart';

class ProtectPage extends StatefulWidget {
  @override
  _ProtectPageState createState() => _ProtectPageState();
}

class _ProtectPageState extends State<ProtectPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ComMomBar(title: 'ProtectPage'),
    );
  }
}
