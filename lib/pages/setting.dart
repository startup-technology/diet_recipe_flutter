import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
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
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('身長',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            Text('160cm'),
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
                        title: Text('体重'),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            Text('50kg'),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/weight_input');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  margin: const EdgeInsets.only(top: 40.0),
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
                  margin: const EdgeInsets.only(top: 40.0),
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
}
