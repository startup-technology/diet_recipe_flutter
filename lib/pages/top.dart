import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/layouts/header.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[_targetWeight(), _currentWeight()],
      )),
    );
  }

  Widget _targetWeight() {
    return Container(
        margin: EdgeInsets.only(top: 16.0, bottom: 30.0),
        child: Row(
          // 1行目
          children: <Widget>[
            Expanded(
              // 2.1列目
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "目標体重",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Container(
                    // 3.1.2行目
                    child: Text(
                      "45kg",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _currentWeight() {
    return Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Row(
          // 1行目
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn('65kg', "体重"), // 2.1
            _buildButtonColumn('160cm', "身長"), // 2.2
            _buildButtonColumn('+5', "体重増減") // 2.3
          ],
        ));
  }

  Widget _buildButtonColumn(String physical, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(physical, style: TextStyle(fontSize: 25.0)), // 3.1.1
        Container(
          // 3.1.2
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
