import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WeightInputPage extends StatefulWidget {
  @override
  _WeightInputPageState createState() => _WeightInputPageState();
}

class _WeightInputPageState extends State<WeightInputPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        findBodyWeight();
                        Navigator.pushNamed(context, '/day_result');
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
        join(await getDatabasesPath(), 'current_weight.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        create table current_weights (
          id integer primary key autoincrement,
          body_weight integer not null)
      ''');
    });

    return database;
  }

  void insertBodyWeight(int bodyWeight) async {
    final Database db = await createDatabase();

    await db.insert('current_weights', {'current_weight': bodyWeight});
  }

  findBodyWeight() async {
    final Database db = await createDatabase();

    List<Map> bodyWeights = await db.rawQuery('SELECT * FROM current_weights');

    print(bodyWeights);

    return bodyWeights;
  }
}
