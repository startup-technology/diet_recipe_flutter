import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DayResultPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '教官のお言葉',
      home: Scaffold(
        appBar: AppBar(
          title: Text('教官のお言葉'),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image.asset('assets/neko1_600x400.jpg'),
              _resultArea(context),
              _angerlevelArea(),
              _angermessageArea(),
              _snsshareArea()
            ],
          )
        )
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('教官のお言葉'),
    //   ),
    //   body: Center(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Flexible(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: <Widget>[
    //               new Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   new Flexible(
    //                     child: new Text('User Name:'),
    //                   ),
    //                   new Flexible(
    //                     child: new Card(
    //                       // margin: const EdgeInsets.all(15.0),
    //                       // padding: const EdgeInsets.all(3.0),
    //                       // decoration: new BoxDecoration(
    //                       //   border: new Border.all(color: Colors.blueAccent)
    //                       // ),
    //                       child: new Text(
    //                         'あああ',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                         // maxLines: 1,
    //                         // overflow: TextOverflow.ellipsis,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               new Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   new Flexible(
    //                     child: new Text('Password:'),
    //                   ),
    //                   new Flexible(
    //                     child: new Container(
    //                       margin: const EdgeInsets.all(15.0),
    //                       padding: const EdgeInsets.all(3.0),
    //                       decoration: new BoxDecoration(
    //                           border: new Border.all(color: Colors.blueAccent)),
    //                       child: new TextField(
    //                         style: Theme.of(context).textTheme.body1,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Text(
    //                 'ああああ',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //                 maxLines: 1,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //               Text(
    //                 'いいいい',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //                 maxLines: 1,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ],
    //           ),
    //         ),
    //         Text(
    //           'えええええええええ',
    //           style:TextStyle(
    //             background : Paint()..color = Colors.deepOrangeAccent,
    //             fontSize: 24,
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //         RaisedButton(
    //           child: Text('戻る'),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/weight_input');
    //           },
    //         ),
    //       ],
    //     )
    //   ),
    // );
  }
}

Widget _resultArea(context) {
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
                  RaisedButton(
                    child: Text('戻る'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/weight_input');
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "体重増減：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0
                          ),
                        ),
                        Text(
                          "+5kg",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0
                          ),
                        )
                      ]
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "BMI：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0
                          ),
                        ),
                        Text(
                          "135",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0
                          ),
                        )
                      ]
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.red,
              size: 30.0,
            ),
          ],
        )
      )
    )
  );
}

Widget _angerlevelArea() {
  return Container(
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        "怒りレベル",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0
                        ),
                      ),
                      Text(
                        "80%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          Image(
            image: AssetImage('images/instructor.png'),
            fit: BoxFit.fill,
            width: 100.0,
          ),
        ],
      )
    )
  );
}

Widget _angermessageArea() {
  return Container(
    child: Container(
      // padding: const EdgeInsets.all(16.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/bubble.png'),
              fit: BoxFit.fill,
              height: 400.0,
            ),
          ]
        ),
      ),
    )
  );
}

Widget _snsshareArea() {
  return Container(
    child: Card(
      elevation: 4.0,
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
                      "教官のお言葉をTweetして反省しよう",
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                      ),
                      onPressed: () {
                        Share.share(
                          "シェアしたい内容を記入"
                        );
                        // if (_formKey.currentState.validate()) {
                        //   _formKey.currentState.save();
                        //   Share.share(
                        //     "シェアしたい内容を記入"
                        //   );
                        // }
                      },
                    )

                  ),
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
        )
      )
    )
  );
}