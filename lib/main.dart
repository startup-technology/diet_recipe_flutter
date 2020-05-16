import 'package:flutter/material.dart';
// import 'package:dietrecipeflutter/routes.dart';
import 'package:dietrecipeflutter/pages/height_input.dart';
import 'package:dietrecipeflutter/pages/target_weight_input.dart';
import 'package:dietrecipeflutter/pages/weight_input.dart';
import 'package:dietrecipeflutter/pages/setting.dart';
import 'package:dietrecipeflutter/pages/calendar.dart';
import 'package:dietrecipeflutter/pages/day_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HeightInputPage(),
        '/height_input': (BuildContext context) => HeightInputPage(),
        '/target_weight_input': (BuildContext context) => TargetWeightInputPage(),
        '/weight_input': (BuildContext context) => WeightInputPage(),
        '/calendar': (BuildContext context) => CalendarPage(),
        '/setting': (BuildContext context) => SettingPage(),
        '/day_result': (BuildContext context) => DayResultPage(),
      }
      // routes: routes,
    );
  }
}
