import 'package:flutter/material.dart';

class DayResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教官のお言葉'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('戻る'),
            onPressed: () {
              Navigator.pushNamed(context, '/weight_input');
            },
          ),
        ],
      )),
    );
  }
}
