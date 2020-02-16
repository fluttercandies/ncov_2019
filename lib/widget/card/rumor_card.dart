import 'package:flutter/material.dart';
import 'package:ncov_2019/api/rumor_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';

class RumorCard extends StatelessWidget {
  final RumorListModel model;
  final EdgeInsetsGeometry margin;
  final GestureTapCallback onTap;

  RumorCard(this.model, {@required this.margin, this.onTap});

  static TextStyle defStyle = TextStyle(
      color: Color(0xff999999), fontSize: 16.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        gradient: LinearGradient(
          colors: [Color(0xff68869e), Color(0xff292f4b)],
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            '${model?.title ?? '未知'}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          new Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('${model?.mainSummary ?? '未知'}', style: defStyle),
                new Text('${model?.summary ?? '未知'}', style: defStyle),
                new Space(),
                new Visibility(
                  visible: model.isOpen,
                  child: new Text(
                    '${model?.body ?? '未知'}',
                    style: TextStyle(color: Color(0xff999999), fontSize: 16.0),
                  ),
                ),
                new GestureDetector(
                  child: new Padding(
                    padding: EdgeInsets.all(3.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Text(
                          '${model.isOpen ? '收起' : '展开'}详情',
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        new Icon(
                          model.isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Color(0xff999999),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    if (onTap != null) {
                      onTap();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
