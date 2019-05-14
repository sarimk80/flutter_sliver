import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Foundation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return CupertinoPageScaffold(
          child: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              widget.title,
              style: TextStyle(color: CupertinoColors.white),
            ),
            trailing: Icon(CupertinoIcons.home),
            backgroundColor: CupertinoColors.activeGreen,
            actionsForegroundColor: CupertinoColors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Hello IOS $index"),
                );
              },
              childCount: 40,
            ),
          ),
        ],
      ));
    } else {
      return Scaffold(
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.pink,
              expandedHeight: 200,
              pinned: true,
              title: Text(widget.title),
              actions: <Widget>[Icon(Icons.movie)],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Hello Android $index"),
                  );
                },
                childCount: 40,
              ),
            )
          ],
        ),
      );
    }
  }
}
