import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalenderExampleState();
  }
}

class _CalenderExampleState extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();

  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
    //Fluttertoast.showToast(msg: date.toString());
    Navigator.pushNamed(
        context,
        '/day_log',
        arguments: date
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("カレンダー"),
        ),
        body: Container(
          child: CalendarCarousel<Event>(
              locale: 'JA',
              onDayPressed: onDayPressed,
              weekendTextStyle: TextStyle(color: Colors.red),
              thisMonthDayBorderColor: Colors.grey,
              weekFormat: false,
              height: 420.0,
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: true,
              customGridViewPhysics: NeverScrollableScrollPhysics(),
              markedDateShowIcon: true,
              markedDateIconMaxShown: 2,
              todayTextStyle: TextStyle(
                color: Colors.blue,
              ),
              markedDateIconBuilder: (event) {
                return event.icon;
              },
              todayBorderColor: Colors.green,
              markedDateMoreShowTotal: false),
        ));
  }
}

