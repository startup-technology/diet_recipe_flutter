import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カレンダー'),
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
