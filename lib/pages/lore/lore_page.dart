import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncov_2019/api/lore_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/card/lore_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LorePage extends StatefulWidget {
  @override
  _LorePageState createState() => _LorePageState();
}

class _LorePageState extends State<LorePage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List data = new List();

  @override
  void initState() {
    super.initState();
    Notice.addListener(NCOVActions.toTabBarIndex(), (index) {
      if (!listNoEmpty(data)) getData();
    });
    getData();
  }

  @override
  bool get wantKeepAlive => true;

  getData() {
    loreViewModel.getLore().then((v) {
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
    LoreModel model = data[index];
    return new LoreCard(model);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
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
