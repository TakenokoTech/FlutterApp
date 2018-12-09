import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/FLog.dart';
import '../model/Sample1Model.dart';

abstract class Sample1ViewModel {
  Stream<List<Sample1>> get stream;
  int get count;
  Sink<String> get addition;
}

class Sample1ViewModelImpl implements Sample1ViewModel {
  Sample1Model model = Sample1ModelImpl();

  BehaviorSubject<List<Sample1>> _sampleListSub;
  var _additionStream = StreamController<String>();

  Stream<List<Sample1>> get stream {
    return _sampleListSub.stream;
  }

  int get count {
    return _sampleListSub.value.length;
  }

  Sink<String> get addition {
    return _additionStream.sink;
  }

  Sample1ViewModelImpl() {
    _sampleListSub = BehaviorSubject<List<Sample1>>(seedValue: model.list);

    _additionStream.stream.listen((str) {
      flog.info("listen. " + str);
      model.add(str);
      _sampleListSub.add(model.list);
    });
  }

  void dispose() {
    _sampleListSub.close();
    _additionStream.close();
  }
}
