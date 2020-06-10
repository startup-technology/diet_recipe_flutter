import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class WeightInputPage extends StatefulWidget {
  @override
  _WeightInputPageState createState() => _WeightInputPageState();
}

class _WeightInputPageState extends State<WeightInputPage> {
  final inputDateController = TextEditingController();
  final bodyWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: AppBar(
        title: Text('現在体重を入力してください'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 100.0, left: 30.0, bottom: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: inputDateController
                        ..text = DateFormat('yyyy年 MM月dd日').format(now),
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                    child: TextField(
                      controller: bodyWeightController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('kg'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      child: Text('登録して教官のお言葉をもらう'),
                      color: Color(0xFFFFF8E0),
                      onPressed: () {
                        insertBodyWeight(DateFormat('yyyy-MM-dd').format(now),
                            int.parse(bodyWeightController.text));
                        Navigator.pushNamed(context, '/day_result');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    inputDateController.dispose();
    bodyWeightController.dispose();
    super.dispose();
  }

  createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'body_weight.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table body_weights (
          id integer primary key autoincrement,
          input_date datetime not null,
          body_weight integer not null)
      ''');
    });

    return database;
  }

  void insertBodyWeight(String inputDate, int bodyWeight) async {
    final Database db = await createDatabase();

    await db.insert(
        'body_weights', {'input_date': inputDate, 'body_weight': bodyWeight});
  }
}
