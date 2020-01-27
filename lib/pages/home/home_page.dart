import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/card/news_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _refreshData() async {
    final Completer<Null> completer = new Completer<Null>();

//    loadData();

    new Future.delayed(new Duration(seconds: 2), () {
      completer.complete(null);
      _refreshController.refreshCompleted();
    });

    return completer.future;
  }

  Widget buildItem(context, index) {
    return new NewsCard();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ComMomBar(title: '首页'),
      body: new SmartRefresher(
        controller: _refreshController,
        onRefresh: _refreshData,
        child: new ListView.builder(itemBuilder: buildItem),
      ),
    );
  }
}
