import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:share/share.dart';
import 'package:sqflite/sqflite.dart';

class DayResultPage extends StatefulWidget {
  @override
  _DayResultPageState createState() => _DayResultPageState();
}

class _DayResultPageState extends State<DayResultPage> {
  int bodyWeight = 0;
  int currentHeight = 0;

  _DayResultPageState() {
    findBodyWeight().then((val) => setState(() {
          bodyWeight = val;
        }));
    findTargetBodyWeight().then((val) => setState(() {
          currentHeight = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教官のお言葉'),
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _angerlevelArea(bodyWeight, currentHeight),
              _angermessageArea(bodyWeight, currentHeight),
              _snsshareArea()
            ],
          )),
    );
  }

  Future<int> findBodyWeight() async {
    final Database db =
        await openDatabase(join(await getDatabasesPath, 'body_weight.db'));
    DateTime now = DateTime.now();

    List<Map> bodyWeights = await db.rawQuery('''
        SELECT * 
        FROM body_weights 
        WHERE DATE(input_date) = DATE('$now')
        ORDER BY id DESC
        LIMIT 1
      ''');

    return bodyWeights.first['body_weight'];
  }

  Future<int> findCurrentHeight() async {
    final Database db =
        await openDatabase(join(await getDatabasesPath, 'current_height.db'));

    List<Map> currentHeights = await db.rawQuery('''
            SELECT * 
            FROM current_heights
            ORDER BY id DESC
            LIMIT 1
            ''');

    return currentHeights.first['current_height'];
  }

  Future<int> findTargetBodyWeight() async {
    final Database db = await openDatabase(
        join(await getDatabasesPath, 'target_body_weight.db'));

    List<Map> targetBodyWeights = await db.rawQuery('''
            SELECT * 
            FROM target_body_weights
            ORDER BY id DESC
            LIMIT 1
            ''');

    return targetBodyWeights.first['body_weight'];
  }
}

Widget _angerlevelArea(weight, height) {
  return Container(
      child: Container(
          child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_bmi(weight, height)],
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

Widget _bmi(weight, height) {
  var heightMeter = height / 100;
  double bmi = weight / (heightMeter * heightMeter);
  var angerPercent = '';
  if (bmi <= 18.5) {
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
                          "体重増減：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          "+5kg",
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
  var image = 'images/kyoukan1.png';
  if (bmi <= 18.5) {
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
