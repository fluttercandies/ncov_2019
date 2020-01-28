import 'package:flutter/material.dart';
import 'package:ncov_2019/api/protect_view_model.dart';
import 'package:ncov_2019/commom/commom.dart';

class ProtectCard extends StatelessWidget {
  final ProtectModel model;
  final EdgeInsetsGeometry margin;

  ProtectCard(this.model, {@required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: lineColor, width: 0.2)),
      ),
      margin: margin,
      child: new FlatButton(
        onPressed: () => routePush(
          new WebViewPage(model?.linkUrl ?? 'http://book.flutterj.com/',
              '${model?.title ?? '未知'}'),
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '${model?.title ?? '未知'}',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    new Space(height: 15.0),
                    new Text(
                      '${timeHandle(model?.createTime ?? 0)}',
                      style: TextStyle(color: mainTextColor),
                    ),
                  ],
                ),
              ),
            ),
            new ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: new CachedNetworkImage(
                imageUrl:
                    '${strNoEmpty(model?.imgUrl) ? model.imgUrl : defImg}',
                height: 68.0,
                width: 91.0,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
