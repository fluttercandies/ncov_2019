import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncov_2019/api/protect_view_model.dart';
import 'package:ncov_2019/api/statistics_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/card/protect_card.dart';
import 'package:ncov_2019/widget/item/statics.dart';
import 'package:ncov_2019/widget/view/title_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProtectPage extends StatefulWidget {
  @override
  _ProtectPageState createState() => _ProtectPageState();
}

class _ProtectPageState extends State<ProtectPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List data = new List();
  StatisticsModel statisticsModel = new StatisticsModel();

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
    protectViewModel.getData().then((v) {
      setState(() => data = v);
    });
    statisticsViewModel.getData().then((v) {
      setState(() => statisticsModel = v);
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

  Widget buildItem(item) {
    ProtectModel model = item;
    return new ProtectCard(
      model,
      margin: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: model.id == data[0].id ? 0.0 : 0,
        bottom: model.id == data[data.length - 1].id ? 10.0 : 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: new SmartRefresher(
        controller: _refreshController,
        onRefresh: _refreshData,
        child: new SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Space(),
              new TitleView('全国统计  ${timeHandle(statisticsModel?.modifyTime ?? 0)}'),
              new Statics(statisticsModel),
              new Divider(),
              new TitleView('防护知识'),
              listNoEmpty(data)
                  ? new Column(children: data.map(buildItem).toList())
                  : new Center(
                child: new Text(
                  '暂无数据',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
