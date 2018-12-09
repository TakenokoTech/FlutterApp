import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';
import './Sample1View.dart';
import './Sample2View.dart';

class RootView extends StatelessWidget {
  static String get path => "/root";

  @override
  Widget build(BuildContext context) {
    return Sample1View();
  }
}
