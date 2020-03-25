import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:CovidThai/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics by Saharak Manoo', style: TextStyle(color: Colors.white, fontFamily: 'Mitr')),
        actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.white,
                onPressed: () {
                  signOut(context);
                })
          ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://data-covid-2019.herokuapp.com/",
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      )
    );
  }
  void signOut(BuildContext context) {
    _auth.signOut();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
        ModalRoute.withName('/'));
  }
}