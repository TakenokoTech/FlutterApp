import 'package:flutter/material.dart';
import 'view/RootView.dart';
import 'view/Sample1View.dart';
import 'view/Sample2View.dart';
import 'package:logging/logging.dart';
import 'utils/FLog.dart';

void main() {
  fLogInit();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootView(), // MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        Sample1View.path: (BuildContext context) => Sample1View(),
        Sample2View.path: (BuildContext context) => Sample2View(),
      },
    );
  }
}
