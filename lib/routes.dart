import 'package:dietrecipeflutter/pages/top.dart';
import 'package:flutter/material.dart';

import 'package:dietrecipeflutter/pages/height_input.dart';
import 'package:dietrecipeflutter/pages/weight_input.dart';
import 'package:dietrecipeflutter/pages/target_weight_input.dart';
import 'package:dietrecipeflutter/pages/setting.dart';
import 'package:dietrecipeflutter/pages/calendar.dart';
import 'package:dietrecipeflutter/pages/day_result.dart';
import 'package:dietrecipeflutter/pages/day_log.dart';
import 'package:dietrecipeflutter/pages/entry_user.dart';
import 'package:dietrecipeflutter/pages/login.dart';

final routes = {
  '/': (BuildContext context) => TopPage(),
  '/height_input': (BuildContext context) => HeightInputPage(),
  '/target_weight_input': (BuildContext context) => TargetWeightInputPage(),
  '/weight_input': (BuildContext context) => WeightInputPage(),
  '/calendar': (BuildContext context) => CalendarPage(),
  '/setting': (BuildContext context) => SettingPage(),
  '/day_result': (BuildContext context) => DayResultPage(),
  '/day_log': (BuildContext context) => DayLogPage(),
  '/entry_user': (BuildContext context) => EntryUserPage(),
  '/login': (BuildContext context) => LoginPage(),
};
