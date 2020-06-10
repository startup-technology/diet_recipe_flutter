import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dietrecipeflutter/database/database_helper.dart';

class TargetWeightInputPage extends StatefulWidget {
  @override
  _TargetWeightInputPageState createState() => _TargetWeightInputPageState();
}

class _TargetWeightInputPageState extends State<TargetWeightInputPage> {
  final myController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: AppBar(
        title: Text(title()),
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

  void insertBodyWeight(int bodyWeight) async {
    Map<String, dynamic> row = {
      'body_weight' : bodyWeight,
    };
    await dbHelper.insert(row, 'target_body_weights');
  }

  findBodyWeight() async {
    Database db = await dbHelper.database;
    List<Map> bodyWeights = await db.rawQuery('SELECT * FROM target_body_weights ORDER BY ID DESC LIMIT 1');
    return bodyWeights;
  }

  title() {
    var title;
    if (findBodyWeight() != null) {
      title = '目標体重を編集してください';
    } else {
      title = '目標体重を入力してください';
    }
    return title;
  }
}
