import 'package:flutter/material.dart';
import 'package:ncov_2019/pages/home/home_page.dart';
import 'package:ncov_2019/pages/lore/lore_page.dart';
import 'package:ncov_2019/pages/protect/protect_page.dart';
import 'package:ncov_2019/pages/root/root_tabbar.dart';
import 'package:ncov_2019/pages/rumor/rumor_page.dart';

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
          icon: new LoadImage("assets/images/tabbar_chat_c.webp"),
          selectIcon: new LoadImage("assets/images/tabbar_chat_s.webp"),
          page: new HomePage()),
      new TabBarModel(
        title: '辟谣',
        icon: new LoadImage("assets/images/tabbar_contacts_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_contacts_s.webp"),
        page: new RumorPage(),
      ),
      new TabBarModel(
        title: '防护合辑',
        icon: new LoadImage("assets/images/tabbar_discover_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_discover_s.webp"),
        page: new ProtectPage(),
      ),
      new TabBarModel(
        title: '疾病知识',
        icon: new LoadImage("assets/images/tabbar_me_c.webp"),
        selectIcon: new LoadImage("assets/images/tabbar_me_s.webp"),
        page: new LorePage(),
      ),
    ];
    return new RootTabBar(pages: pages, currentIndex: 0);
  }
}

class LoadImage extends StatelessWidget {
  final String img;

  LoadImage(this.img);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      child: new Image.asset(img, fit: BoxFit.cover, gaplessPlayback: true),
    );
  }
}
