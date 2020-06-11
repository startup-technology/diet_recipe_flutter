import 'package:dietrecipeflutter/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DayLogPage extends StatefulWidget {
  @override
  _DayLogPageState createState() => _DayLogPageState();
}

class _DayLogPageState extends State<DayLogPage> {
  int bodyWeight = 0;
  int currentHeight = 0;
  int targetBodyWeight = 0;
  final dbHelper = DatabaseHelper.instance;

  _DayLogPageState() {
    findCurrentHeight().then((val) => setState(() {
      currentHeight = val;
    }));

    findTargetBodyWeight().then((val) => setState(() {
      targetBodyWeight = val;
    }));
  }

  @override
  Widget build(BuildContext context) {
    final datetime = ModalRoute.of(context).settings.arguments;
    findBodyWeight(datetime).then((val) => setState(() {
          bodyWeight = val;
    }));

    initializeDateFormatting('ja_JP');
    return Scaffold(
      appBar: AppBar(
        title: Text((DateFormat('yyyy/MM/dd(E)', 'ja_JP')).format(datetime) + 'の教官のお言葉'),
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _angerlevelArea(bodyWeight, currentHeight, targetBodyWeight),
              _angermessageArea(bodyWeight, currentHeight),
              _snsshareArea()
            ],
          )),
    );
  }

  Future<int> findBodyWeight(datetime) async {
    var query;
    query = await dbHelper.queryRows(
      table: 'body_weights',
      where: 'DATE(input_date) =',
      whereArgs: "DATE('$datetime')"
    );
    return query.first['body_weight'];
  }

  Future<int> findCurrentHeight() async {
    var query;
    query = await dbHelper.queryRowLast('current_heights');
    print(query);
    return query.first['current_height'];
  }

  Future<int> findTargetBodyWeight() async {
    var query;
    query = await dbHelper.queryRowLast('target_body_weights');
    print(query);
    return query.first['body_weight'];
  }
}

Widget _angerlevelArea(weight, height, targetWeight) {
  return Container(
      child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[_bmi(weight, height, targetWeight)],
                ),
              ),
            ],
          )));
}

Widget _angermessageArea(weight, height) {
  return Container(
      child: Container(
        child: Container(
          margin: const EdgeInsets.only(bottom: 4.0),
          child: Column(children: <Widget>[_message(weight, height)]),
        ),
      ));
}

Widget _snsshareArea() {
  return Container(
      child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "教官のお言葉をシェアして反省しよう",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.share,
                          ),
                          onPressed: () {
                            Share.share("シェアしたい内容を記入");
                            // if (_formKey.currentState.validate()) {
                            //   _formKey.currentState.save();
                            //   Share.share(
                            //     "シェアしたい内容を記入"
                            //   );
                            // }
                          },
                        )),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        "※体重はツイートされません",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )));
}

Widget _bmi(weight, height, targetWeight) {
  var heightMeter = height / 100;
  double bmi = weight / (heightMeter * heightMeter);
  var angerPercent = '';
  if (bmi == 0.0) {
    angerPercent = '120%';
  } else if (bmi <= 18.5) {
    angerPercent = '0%';
  } else if (bmi > 18.5 && bmi <= 23) {
    angerPercent = '10%';
  } else if (bmi > 23 && bmi <= 25) {
    angerPercent = '50%';
  } else if (bmi > 25 && bmi <= 30) {
    angerPercent = '70%';
  } else if (bmi > 30 && bmi <= 35) {
    angerPercent = '80%';
  } else if (bmi > 35) {
    angerPercent = '100%';
  }

  return Container(
    child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(
                          "目標体重まで：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                         (weight - targetWeight).toString() + "kg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        )
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(
                          "BMI：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ]),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        child: Row(children: <Widget>[
                          Text(
                            "怒りレベル: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            angerPercent,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ])),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_upward,
                color: Colors.red,
                size: 30.0,
              ),
            ],
          ),
        )),
  );
}

Widget _message(weight, height) {
  var heightMeter = height / 100;
  double bmi = weight / (heightMeter * heightMeter);
  var message = '';
  var image = '';
  print(bmi);
  if (bmi == 0.0) {
    message = '毎日記録しろ！';
    image = 'images/kyoukan4.png';
  } else if (bmi <= 18.5) {
    message = '少しは食べていいんだぞ！';
    image = 'images/kyoukan1.png';
  } else if (bmi > 18.5 && bmi <= 23) {
    message = 'まだ問題ないけど、\n油断は禁止だぞ！';
    image = 'images/kyoukan1.png';
  } else if (bmi > 23 && bmi <= 25) {
    message = 'お前そろそろやばいんじゃないか！\nデブになりたいのか！\nこれ以上だとお前は豚だぞ！\nわかってるのか？';
    image = 'images/kyoukan2.png';
  } else if (bmi > 25 && bmi <= 30) {
    message = 'もうお前はデブだな、ラーメン、肉、ご飯が\nそんなにうまいのか！\nダイエットする気はないよね？\nやめっちまえば？';
    image = 'images/kyoukan3.png';
  } else if (bmi > 30 && bmi <= 35) {
    message = 'お前もう豚じゃねえかよ。\n餌あげよか？';
    image = 'images/kyoukan4.png';
  } else if (bmi > 35) {
    message = '死ぬ気でダイエットしないとお前、\n本当に死んじゃうよ。';
    image = 'images/kyoukan4.png';
  }

  return Container(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(image),
              fit: BoxFit.fill,
              height: 100.0,
            ),
            Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ],
        ),
      ));
}
