import 'package:flutter/material.dart';
import 'package:example/page/index.dart';
import 'package:flutter_fragments/flutter_fragments.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<_PageModel> list = [
    _PageModel(title: "Fragments", delegate: DefaultFragmentsDraw(disableTransition: true,)),
    _PageModel(title: "TransitionFragments", delegate: DefaultFragmentsDraw()),
    _PageModel(title: "CustomNumberFragments", delegate: DefaultFragmentsDraw(numberOfRow: 30, numberOfColumn: 30),),
    _PageModel(title: "LineFragments", delegate: LineFragmentsDraw(lines: 100, direction: LineDirection.top)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: HomePage(
          list: list,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<_PageModel> list;

  HomePage({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, int index) {
          _PageModel model = list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return FragmentsDemo(delegate: model.delegate,);
              }));
            },
            child: Card(
              shadowColor: Colors.blue[200],
              elevation: 10,
              margin: EdgeInsets.only(top: 10),
              color: Colors.pink,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  model?.title ?? "unKnow",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PageModel {
  final String title;
  final FragmentsDrawDelegate delegate;

  _PageModel({this.title, this.delegate});
}
