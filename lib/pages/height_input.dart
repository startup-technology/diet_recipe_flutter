import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/database/database_helper.dart';

class HeightInputPage extends StatefulWidget {
  @override
  _HeightInputPageState createState() => _HeightInputPageState();
}

class _HeightInputPageState extends State<HeightInputPage> {
  final myController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

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

  void insertCurrentHeight(int currentHeight) async {
    Map<String, dynamic> row = {
      'current_height' : currentHeight,
    };
    await dbHelper.insert(row, 'current_heights');
  }

  findCurrentHeight() async {
    var query = await dbHelper.queryRowLast('current_heights');
    return query;
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
