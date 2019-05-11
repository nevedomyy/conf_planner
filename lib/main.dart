import 'package:flutter/material.dart';
import 'disclaimer.dart';
import 'menu.dart';
import 'prayers.dart';
import 'assessment.dart';
import 'saved.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Disclaimer',
      routes: {
        'Menu': (context) => Menu(false),
        'Prayers': (context) => Prayers(),
        'Assessment': (context) => Assessment('w1'),
        'Saved': (context) => Saved(),
      },
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: Disclaimer(),
    );
  }
}