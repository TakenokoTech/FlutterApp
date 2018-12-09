import 'package:flutter/material.dart';

class Sample2View extends StatelessWidget {
  static String get path => "/second";
  List<AbsTabView> tabList = <AbsTabView>[
    Children1(),
    Children2(),
    Children3()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Demo'),
            bottom: TabBar(
              tabs: tabList.map((tab) => Tab(icon: Icon(tab.tabIcon))).toList(),
            ),
          ),
          body: TabBarView(children: tabList),
        ),
      ),
    );
  }
}

abstract class AbsTabView extends StatelessWidget {
  IconData get tabIcon;
}

class Children1 extends StatelessWidget implements AbsTabView {
  IconData get tabIcon => Icons.directions_car;
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_car);
  }
}

class Children2 extends StatelessWidget implements AbsTabView {
  IconData get tabIcon => Icons.directions_transit;
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_transit);
  }
}

class Children3 extends StatelessWidget implements AbsTabView {
  IconData get tabIcon => Icons.directions_bike;
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_bike);
  }
}
