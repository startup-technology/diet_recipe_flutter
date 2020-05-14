import 'package:flutter/material.dart';

class TargetWeightInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目標体重を入力してください'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('登録'),
            onPressed: () {
              Navigator.pushNamed(context, '/weight_input');
            },
          ),
          RaisedButton(
            child: Text('戻る'),
            onPressed: () {
              Navigator.pushNamed(context, '/height_input');
            },
          ),
        ],
      )),
    );
  }
}
