import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HeightInputPage extends StatefulWidget {
  @override
  _HeightInputPageState createState() => _HeightInputPageState();
}

class _HeightInputPageState extends State<HeightInputPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('現在の身長を入力してください'),
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
                      child: Text('cm'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        insertCurrentHeight(int.parse(myController.text));
                        findCurrentHeight();
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
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'diet_recipe.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE current_heights(id INTEGER PRIMARY KEY, current_height INTEGER)');
    });

    return database;
  }

  void insertCurrentHeight(int currentHeight) async {
    final Database db = await createDatabase();

    await db.insert(
      'current_heights',
      {'current_height': currentHeight},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  findCurrentHeight() async {
    final Database db = await createDatabase();

    List<Map> currentHeights =
        await db.rawQuery('SELECT * FROM current_heights');

    print(currentHeights);

    return currentHeights;
  }
}
