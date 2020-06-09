import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TargetWeightInputPage extends StatefulWidget {
  @override
  _TargetWeightInputPageState createState() => _TargetWeightInputPageState();
}

class _TargetWeightInputPageState extends State<TargetWeightInputPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: AppBar(
        title: Text('目標体重を入力してください'),
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
                      controller: myController,
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
                      onPressed: () {
                        insertBodyWeight(int.parse(myController.text));
                        Navigator.pushNamed(context, '/weight_input');
                      },
                      child: Text('登録'),
                      color: Color(0xFFFFF8E0),
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
    myController.dispose();
    super.dispose();
  }

  createDatabase() async {
    Database database = await openDatabase(
        join(await getDatabasesPath, 'target_body_weight.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        create table target_body_weights (
          id integer primary key autoincrement,
          body_weight integer not null)
      ''');
    });

    return database;
  }

  void insertBodyWeight(int bodyWeight) async {
    final Database db = await createDatabase();

    await db.insert('target_body_weights', {'body_weight': bodyWeight});
  }
}
