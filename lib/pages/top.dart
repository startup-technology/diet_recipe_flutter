import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/ui/chart/line_chart.dart';
import 'package:dietrecipeflutter/ui/chart/bar_chart.dart';
import 'package:dietrecipeflutter/ui/chart/pie_chart.dart';

class TopPage extends StatelessWidget {
  List<double> points = [50, 55, 60, 55, 60, 61, 55, 54];

  List<String> labels = [
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: Card(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              _targetWeight(), _currentWeight(),
              Text('体重変動', style: TextStyle(fontSize: 20.0)), // 3.1.1
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: CustomPaint(
                  size: Size(240, 240),
                  painter: LineChart(
                      points: points,
                      pointSize: 5.0,
                      pointColor: Colors.pinkAccent,
                      lineColor: Colors.pinkAccent,
                      lineWidth: 2.0),
                ),
              ),
            ],
          )),
    );
  }

  Widget _targetWeight() {
    return Container(
        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
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
                  Container(
                    margin: EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _currentWeight() {
    return Container(
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
          margin: const EdgeInsets.only(top: 8.0, bottom: 60.0),
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
