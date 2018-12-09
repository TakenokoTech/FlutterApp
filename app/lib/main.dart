import 'package:flutter/material.dart';
import 'view/RootView.dart';
import 'package:logging/logging.dart';
import 'utils/FLog.dart';

void main() {
  fLogInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootView(), // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
