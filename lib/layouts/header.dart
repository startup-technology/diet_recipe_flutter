import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  // ヘッダータイトルを格納する変数を追加
  final String headerTitle;
  Header({this.headerTitle});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ダイエット'),
    );
  }
}
