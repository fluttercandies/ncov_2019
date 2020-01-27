import 'package:flutter/material.dart';
import 'package:ncov_2019/commom/commom.dart';
import 'package:ncov_2019/pages/home/home_page.dart';
import 'package:ncov_2019/pages/lore/lore_page.dart';
import 'package:ncov_2019/pages/protect/protect_page.dart';
import 'package:ncov_2019/pages/rumor/rumor_page.dart';
import 'package:ncov_2019/widget/root_tabbar.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    List<TabBarModel> pages = <TabBarModel>[
      new TabBarModel(
        title: '首页',
        icon: new LoadImage("assets/images/bottom_home.png", false),
        selectIcon: new LoadImage("assets/images/bottom_home.png", true),
        page: new HomePage(),
      ),
      new TabBarModel(
        title: '辟谣',
        icon: new LoadImage("assets/images/bottom_rumor.png", false),
        selectIcon: new LoadImage("assets/images/bottom_rumor.png", true),
        page: new RumorPage(),
      ),
      new TabBarModel(
        title: '防护合辑',
        icon: new LoadImage("assets/images/bottom_protect.png", false),
        selectIcon: new LoadImage("assets/images/bottom_protect.png", true),
        page: new ProtectPage(),
      ),
      new TabBarModel(
        title: '疾病知识',
        icon: new LoadImage("assets/images/bottom_lore.png", false),
        selectIcon: new LoadImage("assets/images/bottom_lore.png", true),
        page: new LorePage(),
      ),
    ];
    return new RootTabBar(pages: pages, currentIndex: 0);
  }
}

class LoadImage extends StatelessWidget {
  final String img;
  final bool isSelect;

  LoadImage(this.img, [this.isSelect = false]);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      width: 30.0,
      height: 30.0,
      child: new Image.asset(
        img,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        color: isSelect ? fixedColor : mainTextColor,
      ),
    );
  }
}
