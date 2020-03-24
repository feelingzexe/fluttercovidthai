import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles', style: TextStyle(color: Colors.white, fontFamily: 'Mitr')),
      ),
    );
  }
}