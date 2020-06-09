import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DayResultPage extends StatelessWidget {
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
                _angerlevelArea(),
                _angermessageArea(),
                _snsshareArea()
              ],
            )));
  }
}

Widget _angerlevelArea() {
  return Container(
      child: Container(
          child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_bmi(80, 160)],
        ),
      ),
    ],
  )));
}

Widget _angermessageArea() {
  return Container(
      child: Container(
    child: Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      child: Column(children: <Widget>[_message(80, 160)]),
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
  var height_meter = height / 100;
  double bmi = weight / (height_meter * height_meter);
  var anger_percent;
  var message;
  if (bmi <= 18.5) {
    anger_percent = '0%';
    message = '少しは食べていいんだぞ！';
  } else if (bmi > 18.5 && bmi <= 23) {
    anger_percent = '10%';
    message = 'まだ問題ないけど、油断は禁止だぞ！';
  } else if (bmi > 23 && bmi <= 25) {
    anger_percent = '50%';
    message = 'お前そろそろやばいんじゃないか！デブになりたいのか！これ以上だとお前は豚だぞ！わかってるのか？';
  } else if (bmi > 25 && bmi <= 30) {
    anger_percent = '70%';
    message = 'もうお前はデブだな、ラーメン、肉、ご飯がそんなにうまいのか！ダイエットする気はないよね？やめっちまえば？';
  } else if (bmi > 30 && bmi <= 35) {
    anger_percent = '80%';
    message = 'お前もう豚じゃねえかよ。餌あげよか？';
  } else if (bmi > 35) {
    anger_percent = '100%';
    message = '死ぬ気でダイエットしないとお前、本当に死んじゃうよ。';
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
                            anger_percent,
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
  var height_meter = height / 100;
  double bmi = weight / (height_meter * height_meter);
  var anger_percent;
  var message;
  var image;
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
