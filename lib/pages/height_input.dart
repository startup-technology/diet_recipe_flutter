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
                      child: Text('cm'),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        insertCurrentHeight(int.parse(myController.text));
                        findCurrentHeight();
                        Navigator.pushNamed(context, '/target_weight_input');
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
        join(await getDatabasesPath(), 'current_height.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        create table current_heights (
          id integer primary key autoincrement,
          current_height integer not null)
      ''');
    });

    return database;
  }

  void insertCurrentHeight(int currentHeight) async {
    final Database db = await createDatabase();

    await db.insert('current_heights', {'current_height': currentHeight});
  }

  findCurrentHeight() async {
    final Database db = await createDatabase();

    List<Map> currentHeights =
        await db.rawQuery('SELECT * FROM current_heights');

    print(currentHeights);

    return currentHeights;
  }

  title() {
    var title;
    if (findCurrentHeight() != null) {
      title = '現在の身長を編集してください';
    } else {
      title = '現在の身長を入力してください';
    }
    return title;
  }
}
