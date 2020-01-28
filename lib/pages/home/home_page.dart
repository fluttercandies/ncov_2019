import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ncov_2019/api/news_model.dart';
import 'package:ncov_2019/api/news_view_model.dart';
import 'package:ncov_2019/api/statistics_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/card/news_card.dart';
import 'package:ncov_2019/widget/item/statics.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    timeNewsViewModel.getTimeNews().then((v) {
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
    TimeNewsModel model = item;
    bool isNew = model.id == data[0].id;
    return new NewsCard(
      model,
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: isNew ? 10.0 : 10,
        bottom: model.id == data[data.length - 1].id ? 20.0 : 10,
      ),
      isNew: isNew,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      body: new SmartRefresher(
        controller: _refreshController,
        onRefresh: _refreshData,
//        child: new ListView.builder(
//          itemBuilder: (context,index) {
//            TimeNewsModel model = data[index];
//            bool isNew = model.id == data[0].id;
//            return new NewsCard(
//              model,
//              padding: EdgeInsets.only(
//                left: 20.0,
//                right: 20.0,
//                top: isNew ? 10.0 : 10,
//                bottom: model.id == data[data.length - 1].id ? 20.0 : 10,
//              ),
//              isNew: isNew,
//            );
//          },
//          itemCount: data.length,
//        ),
        child: new ListView(
          children: <Widget>[
            new Space(),
            new TitleView(
                '数据统计  ${timeHandle(statisticsModel?.modifyTime ?? 0)}'),
            new Statics(statisticsModel),
            new Divider(),
            new TitleView('最新消息'),
            listNoEmpty(data)
                ? new Column(children: data.map(buildItem).toList())
                : new Center(
                    child: new Text(
                      '暂无数据',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
