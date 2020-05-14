import 'package:flutter/material.dart';

class WeightInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('体重入力'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('登録して教官のお言葉をもらう'),
            onPressed: () {
              Navigator.pushNamed(context, '/day_result');
            },
          ),
          RaisedButton(
            child: Text('戻る'),
            onPressed: () {
              Navigator.pushNamed(context, '/target_weight_input');
            },
          ),
        ],
      )),
    );
  }
}
