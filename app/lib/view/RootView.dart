import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';
import './Sample1View.dart';

// String
final String textTitle = "Sample Flutter";

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(textTitle), actions: _actionList(context)),
      body: Sample1View(),
    );
  }

  List<Widget> _actionList(BuildContext context) {
    return <Widget>[
      // StreamBuilder<int>(
      //     stream: wordBloc.itemCount,
      //     initialData: 0,
      //     builder: (context, snapshot) =>
      //         CountLabel(favoriteCount: snapshot.data)),
      // new IconButton(
      //     icon: const Icon(Icons.list),
      //     onPressed: () {
      //      Navigator.of(context).pushNamed(BlocFavoritePage.routeName);
      //     })
    ];
  }
}
