import 'dart:collection';
import 'package:app/utils/FLog.dart';

class Sample1 {
  String name;
  Sample1(String name) {
    this.name = name;
  }
}

abstract class Sample1Model {
  UnmodifiableListView<Sample1> get list;
  void add(String name);
  void remove(String name);
}

class Sample1ModelImpl implements Sample1Model {
  final List<Sample1> sample1List = <Sample1>[];

  UnmodifiableListView<Sample1> get list {
    return UnmodifiableListView(sample1List);
  }

  Sample1ModelImpl() {
    flog.info("Sample1Model. init.");
  }

  // [public]

  void add(String name) {
    for (int i = 0; i < sample1List.length; i++) {
      final item = sample1List[i];
      if (name == item.name) {
        final String newString = "Sample" + (sample1List.length + 1).toString();
        sample1List.add(Sample1(newString));
        return;
      }
    }
    sample1List.add(Sample1(name));
  }

  void remove(String name) {
    for (int i = 0; i < sample1List.length; i++) {
      final item = sample1List[i];
      if (name == item.name) {
        sample1List.removeAt(i);
      }
    }
  }

  // [override]

  @override
  String toString() => "$sample1List";
}
