import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/FLog.dart';
import '../model/Sample1Model.dart';

abstract class RootViewModel {
  Stream<String> get stream;
  int get count;
  Sink<String> get addition;
}

class RootViewModelImpl implements RootViewModel {
  Sample1Model model = Sample1ModelImpl();

  BehaviorSubject<String> _stringSub;
  var _additionStream = StreamController<String>();

  Stream<String> get stream {
    return _stringSub.stream;
  }

  int get count {
    return _stringSub.value.length;
  }

  Sink<String> get addition {
    return _additionStream.sink;
  }

  RootViewModelImpl() {
    flog.info("RootViewModelImpl init. ");
    _stringSub = BehaviorSubject<String>(seedValue: "---");

    _additionStream.stream.listen((str) {
      flog.info("listen. " + str);
      _stringSub.add(str);
    });
  }

  void dispose() {
    _stringSub.close();
    _additionStream.close();
  }
}
