import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncov_2019/api/area_view_model.dart';
import 'package:ncov_2019/api/protect_view_model.dart';
import 'package:ncov_2019/api/statistics_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/widget/card/protect_card.dart';
import 'package:ncov_2019/widget/flutter/my_expansion_tile.dart';
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
  List areaData = new List();

  bool isReq = false;

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
      setState(() {
        data = v;
        isReq = true;
      });
    });
    areaViewModel.getData().then((v) {
      setState(() => areaData = v);
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

  Widget _buildCity(item) {
    AreaModelCity model = item;
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: new Row(
        children: [
          '${model?.cityName ?? '未知'}',
          '${model?.confirmedCount ?? 0}',
          '${model?.deadCount ?? 0}',
          '${model?.curedCount ?? 0}'
        ].map((item) {
          return new Container(
            padding: EdgeInsets.only(right: 10.0),
            width: (winWidth(context) - 80) / 4,
            child:
                new Text(item, style: TextStyle(fontWeight: FontWeight.w600)),
          );
        }).toList(),
      ),
    );
  }

  Widget areaBuild(item) {
    AreaModel model = item;
    return new MyExpansionTile(
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '${model?.provinceName ?? '未知'}',
          '${model?.confirmedCount ?? 0}',
          '${model?.deadCount ?? 0}',
          '${model?.curedCount ?? 0}'
        ].map((item) {
          return new Container(
            padding: EdgeInsets.only(right: 10.0),
            width: (winWidth(context) - 80) / 4,
            child:
                new Text(item, style: TextStyle(fontWeight: FontWeight.w600)),
          );
        }).toList(),
      ),
      children: model.cities.map(_buildCity).toList(),
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
              new TitleView('地区统计'),
              new Space(),
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.only(right: 40),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['地区', '确诊', '死亡', '治愈'].map((item) {
                    return new SizedBox(
                      width: (winWidth(context) - 80) / 4,
                      child: new Text(
                        item,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    );
                  }).toList(),
                ),
              ),
              new Column(children: areaData.map(areaBuild).toList()),
              new Divider(),
              new Space(height: mainSpace / 2),
              new TitleView('防护知识'),
              isReq
                  ? listNoEmpty(data)
                      ? new Column(children: data.map(buildItem).toList())
                      : new Center(
                          child: new Text(
                            '暂无数据',
                            style: Theme.of(context).textTheme.display1,
                          ),
                        )
                  : new LoadingView(),
            ],
          ),
        ),
      ),
    );
  }
}
