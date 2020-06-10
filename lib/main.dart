import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/layouts/header.dart';
import 'package:dietrecipeflutter/layouts/root.dart';

import 'package:dietrecipeflutter/pages/height_input.dart';
import 'package:dietrecipeflutter/pages/weight_input.dart';
import 'package:dietrecipeflutter/pages/target_weight_input.dart';
import 'package:dietrecipeflutter/pages/setting.dart';
import 'package:dietrecipeflutter/pages/calendar.dart';
import 'package:dietrecipeflutter/pages/day_result.dart';
import 'package:dietrecipeflutter/pages/day_log.dart';
import 'package:dietrecipeflutter/pages/entry_user.dart';
import 'package:dietrecipeflutter/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // themeを追加
        primaryColor: Colors.pink[100], // 全体の共通色を設定
      ),
      home: Scaffold(
        appBar: Header(),
        body: Center(child: Text('ホーム')),
        bottomNavigationBar: Footer(), // Footerを追加
      ),
      routes: {
        '/height_input': (BuildContext context) => HeightInputPage(),
        '/target_weight_input': (BuildContext context) =>
            TargetWeightInputPage(),
        '/weight_input': (BuildContext context) => WeightInputPage(),
        '/calendar': (BuildContext context) => CalendarPage(),
        '/setting': (BuildContext context) => SettingPage(),
        '/day_result': (BuildContext context) => DayResultPage(),
        '/day_log': (BuildContext context) => DayLogPage(),
        '/entry_user': (BuildContext context) => EntryUserPage(),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
