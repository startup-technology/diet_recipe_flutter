import 'package:dietrecipeflutter/database/database_helper.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int targetBodyWeight = 0;
  int currentHeight = 0;
  final dbHelper = DatabaseHelper.instance;

  _SettingPageState() {
    findTargetBodyWeight().then((val) => setState(() {
          targetBodyWeight = val;
        }));
    findCurrentHeight().then((val) => setState(() {
          currentHeight = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('設定'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Card(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('身長',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            Text(currentHeight.toString() + 'cm'),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/height_input');
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text('目標体重'),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            Text(targetBodyWeight.toString() + 'kg'),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/target_weight_input');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('利用規約',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('プライバシーホリシー'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('お問い合わせ'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('アプリのレビューをする',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('アプリをシェアする'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<int> findCurrentHeight() async {
    var query;
    query = await dbHelper.queryRowLast('current_heights');
    return query.first['current_height'];
  }

  Future<int> findTargetBodyWeight() async {
    var query;
    query = await dbHelper.queryRowLast('target_body_weights');
    return query.first['body_weight'];
  }
}
