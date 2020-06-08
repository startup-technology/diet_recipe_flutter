import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/layouts/header.dart';

class TopPage extends StatelessWidget {
  // 2回使うので変数に格納
  final String screenName = 'ホーム';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
          child: Column(
        children: <Widget>[
          // RaisedButton(
          //   child: Text('ログイン'),
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/login');
          //   },
          // ),
          RaisedButton(
            child: Text('身長登録'),
            onPressed: () {
              Navigator.pushNamed(context, '/height_input');
            },
          ),
          RaisedButton(
            child: Text('目標体重登録'),
            onPressed: () {
              Navigator.pushNamed(context, '/target_weight_input');
            },
          ),
          RaisedButton(
            child: Text('今日体重登録'),
            onPressed: () {
              Navigator.pushNamed(context, '/weight_input');
            },
          ),
          RaisedButton(
            child: Text('カレンダー'),
            onPressed: () {
              Navigator.pushNamed(context, '/calendar');
            },
          ),
          RaisedButton(
            child: Text('設定'),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      )),
    );
  }
}
