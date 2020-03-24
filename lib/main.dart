import 'package:flutter/material.dart';
import 'package:CovidThai/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[200],
        primaryColorDark: Colors.green[400],
      ),
      home: MyLoginPage(),
    );
  }
}
