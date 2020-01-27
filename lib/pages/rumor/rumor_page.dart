import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncov_2019/api/rumor_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/bar/commom_bar.dart';
import 'package:ncov_2019/widget/card/news_card.dart';
import 'package:ncov_2019/widget/card/rumor_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RumorPage extends StatefulWidget {
  @override
  _RumorPageState createState() => _RumorPageState();
}

class _RumorPageState extends State<RumorPage>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> data = new List();

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  bool get wantKeepAlive => true;

  getData() {
    rumorListReqViewModel.getRumor().then((v) {
      setState(() => data = v);
    });
  }


  Future<void> _refreshData() async {
    final Completer<Null> completer = new Completer<Null>();

    getData();

    new Future.delayed(new Duration(seconds: 2), () {
      completer.complete(null);
      _refreshController.refreshCompleted();
    });

    return completer.future;
  }

  Widget buildItem(context, index) {
    RumorListModel model = data[index];
    return new RumorCard(model);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new ComMomBar(title: '辟谣，数据条目${data.length}'),
      body: listNoEmpty(data)
          ? new SmartRefresher(
        controller: _refreshController,
        onRefresh: _refreshData,
        child: new ListView.builder(
          itemBuilder: buildItem,
          itemCount: data.length,
        ),
      )
          : new Center(
        child: new Text(
          '暂无数据',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
