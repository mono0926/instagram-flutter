import 'package:flutter/material.dart';
import 'package:mono_sample/page/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'イッヌスタグラム',
        theme: ThemeData(
            primaryColor: Colors.black, canvasColor: Colors.white),
        home: MainPage());
  }
}
