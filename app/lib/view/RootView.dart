import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';
import './Sample1View.dart';
import './Sample2View.dart';

class RootView extends StatelessWidget {
  static String get path => "/root";
  BehaviorSubject<String> str = BehaviorSubject(seedValue: "---");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(textTitle), actions: _actionList(context)),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Name"),
                accountEmail: new Text("xxxxxxxx@yyyyyy.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://pbs.twimg.com/profile_images/1056577651077337089/XZNO_dv1_400x400.jpg"),
                ),
              ),
              ListTile(
                title: new Text("Sample1View"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Sample1View()));
                },
              ),
              ListTile(
                title: new Text("About"),
                onTap: () {
                  str.add("About");
                },
              ),
              ListTile(
                title: new Text("Help"),
                onTap: () {
                  str.add("Help");
                },
              )
            ],
          ),
        ),
        body: new StreamBuilder<String>(
          stream: str,
          builder: (_, snapshot) => Center(child: Text(snapshot.data)),
        ));
  }

  List<Widget> _actionList(BuildContext context) {
    return <Widget>[
      new IconButton(
          icon: const Icon(Icons.add_box),
          onPressed: () {
            Navigator.of(context).pushNamed(Sample1View.path);
          }),
      new IconButton(
          icon: const Icon(Icons.tab),
          onPressed: () {
            Navigator.of(context).pushNamed(Sample2View.path);
          }),
    ];
  }
}
