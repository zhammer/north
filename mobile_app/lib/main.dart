import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:north/pages/landing_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'north',
      theme: CupertinoThemeData().copyWith(),
      home: LandingPage(title: 'north'),
    );
  }
}
