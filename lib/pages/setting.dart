import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
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
