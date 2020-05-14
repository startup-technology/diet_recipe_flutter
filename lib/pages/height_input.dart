import 'package:flutter/material.dart';

class HeightInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('現在の身長を入力してください'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('登録'),
            onPressed: () {
              Navigator.pushNamed(context, '/target_weight_input');
            },
          ),
          RaisedButton(
            child: Text('体重入力'),
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
          RaisedButton(
            child: Text('教官のお言葉'),
            onPressed: () {
              Navigator.pushNamed(context, '/day_result');
            },
          ),
        ],
      )),
    );
  }
}
