import 'package:flutter/material.dart';
import '../viewmodel/Sample1ViewModel.dart';
import '../utils/FLog.dart';
import '../model/Sample1Model.dart';
import '../view/Sample2View.dart';

// String
final String textTitle = "Sample Flutter";

class Sample1View extends StatelessWidget {
  static String get path => "/first";

  Sample1ViewModel viewModel = Sample1ViewModelImpl();

  Sample1View() {
    flog.info("Sample1View init.");
    viewModel.addition.add("Sample1");
    viewModel.addition.add("Sample2");
    viewModel.addition.add("Sample3");
  }

  Widget build(BuildContext context) {
    flog.info("Sample1View build. ");
    return Scaffold(
      appBar: AppBar(title: Text(textTitle), actions: _actionList(context)),
      body: new StreamBuilder<List<Sample1>>(
        stream: viewModel.stream,
        builder: (_, snapshot) => _buildListView(snapshot),
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot snapshot) {
    flog.info("Sample1View buildListView. ");
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: viewModel.count,
        itemBuilder: (context, index) {
          return _createWordListTile(snapshot.data[index]);
        });
  }

  ListTile _createWordListTile(Sample1 sample) {
    flog.fine("Sample1View _createWordListTile. " + sample.name);

    bool isFavorited = false;
    return new ListTile(
      title: new Text(sample.name),
      trailing: new Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : null,
      ),
      onTap: () {
        flog.info("onTap");
        viewModel.addition.add("Sample4");
        if (isFavorited) {
          // word.wordRemoval.add(WordRemoval(title));
        } else {
          // word.wordAddition.add(WordAddition(title));
        }
      },
    );
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
