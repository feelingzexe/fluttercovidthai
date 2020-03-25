import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:CovidThai/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class MaskMap extends StatefulWidget {
  @override
  _MaskMapState createState() => _MaskMapState();
}

class _MaskMapState extends State<MaskMap> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaskMap Thailand by Eggyo', style: TextStyle(color: Colors.white, fontFamily: 'Mitr')),
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
        initialUrl: "https://maskmapthai.web.app/",
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
