import 'package:flutter/material.dart';
import 'package:dietrecipeflutter/pages/top.dart';
import 'package:dietrecipeflutter/pages/height_input.dart';
import 'package:dietrecipeflutter/pages/calendar.dart';
import 'package:dietrecipeflutter/pages/setting.dart';

class Footer extends StatefulWidget {
  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];
 
  // アイコン情報
  final Map _footerIcons = {
    'ホーム' : {'icon': Icons.home, 'route': TopPage()},
    'カレンダー' : {'icon': Icons.calendar_today, 'route': CalendarPage()},
    '身長入力' : {'icon': Icons.create, 'route': HeightInputPage()},
    '設定' : {'icon': Icons.settings, 'route': SettingPage()},
  };
 
  // アイコン順番
  final List _footerItemOrder = [
    'ホーム',
    'カレンダー',
    '身長入力',
    '設定',
  ];
 
  @override
  void initState() {
    super.initState();
    for ( var i = 0; i < _footerItemOrder.length; i++) {
      _bottomNavigationBarItems.add(_CreateIcon(_footerItemOrder[i]));
    }
  }
 
  // アイコンを作成する
  BottomNavigationBarItem _CreateIcon(String key) {
    return BottomNavigationBarItem(
      icon: Icon(_footerIcons[key]['icon']),
      title: Text(key),
    );
  }
 
  void _onItemTapped(int index) {
    setState( () {
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _footerIcons[_footerItemOrder.asMap()[_selectedIndex]]['route'],
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}