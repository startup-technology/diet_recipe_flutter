import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/ui/chart/line_chart.dart';
import 'package:dietrecipeflutter/database/database_helper.dart';

// import 'package:dietrecipeflutter/ui/chart/bar_chart.dart';
// import 'package:dietrecipeflutter/ui/chart/pie_chart.dart';
class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final dbHelper = DatabaseHelper.instance;
  List<double> points = [50, 55, 60, 55, 60, 61, 55];
  int targetBodyWeight = 0;
  int bodyWeight = 0;
  int currentHeight = 0;
  int remnantWeight = 0;
  _TopPageState() {
    findBodyWeight().then((val) => setState(() {
          bodyWeight = val;
        }));
    findCurrentHeight().then((val) => setState(() {
          currentHeight = val;
        }));
    findTargetBodyWeight().then((val) => setState(() {
          targetBodyWeight = val;
        }));
  }
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
              _targetWeight(targetBodyWeight),
              _currentWeight(currentHeight, bodyWeight, targetBodyWeight),
              Text('体重変動', style: TextStyle(fontSize: 20.0)), // 3.1.1
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: CustomPaint(
                  size: Size(200, 150),
                  painter: LineChart(
                      points: points,
                      pointSize: 5.0,
                      pointColor: Colors.pinkAccent,
                      lineColor: Colors.pinkAccent,
                      lineWidth: 2.0),
                ),
              ),
              RaisedButton(
                child: Text("今日の体重を入力"),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/weight_input');
                },
              ),
            ],
          )),
    );
  }

  Widget _targetWeight(targetBodyWeight) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
        child: Row(
          // 1行目
          children: <Widget>[
            Expanded(
              // 2.1列目
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "目標体重",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Container(
                    // 3.1.2行目
                    child: Text(targetBodyWeight.toString() + ' kg',
                        style: TextStyle(fontSize: 25.0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
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

  Widget _currentWeight(currentHeight, bodyWeight, targetBodyWeight) {
    return Container(
        child: Row(
      // 1行目
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _weightColumn(bodyWeight.toString(), "体重"), // 2.1
        _heightColumn(currentHeight.toString(), "身長"), // 2.2
        _changeWeightColumn(
            (bodyWeight - targetBodyWeight).toString(), "体重増減") // 2.3,
      ],
    ));
  }

  Widget _weightColumn(String physical, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Text(physical, style: TextStyle(fontSize: 25.0)),
          Text('  kg', style: TextStyle(fontSize: 15.0)),
        ]),
        Container(
          // 3.1.2
          margin: const EdgeInsets.only(top: 8.0, bottom: 20.0),
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

  Widget _heightColumn(String physical, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Text(physical, style: TextStyle(fontSize: 25.0)),
          Text('  cm', style: TextStyle(fontSize: 15.0)),
        ]),
        Container(
          // 3.1.2
          margin: const EdgeInsets.only(top: 8.0, bottom: 0.0),
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

  Widget _changeWeightColumn(String physical, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Text(physical, style: TextStyle(fontSize: 25.0, color: Colors.red)),
          Text('  kg', style: TextStyle(fontSize: 15.0)),
        ]),
        Container(
          // 3.1.2
          margin: const EdgeInsets.only(top: 8.0, bottom: 40.0),
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

  Future<int> findBodyWeight() async {
    DateTime now = DateTime.now();
    var query;
    query = await dbHelper.queryRows(
        table: 'body_weights',
        where: 'DATE(input_date) =',
        whereArgs: "DATE('$now')");
    return query.last['body_weight'];
  }

  Future<int> findCurrentHeight() async {
    var query;
    query = await dbHelper.queryRowLast('current_heights');
    print(query);
    return query.last['current_height'];
  }

  Future<int> findTargetBodyWeight() async {
    var query;
    query = await dbHelper.queryRowLast('target_body_weights');
    print(query);
    return query.last['body_weight'];
  }
}
