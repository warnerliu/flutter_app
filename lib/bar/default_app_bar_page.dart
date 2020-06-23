import 'package:flutter/material.dart';

class DefaultAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.keyboard_arrow_left),
          tooltip: 'Navigation menu',
          onPressed: () {
            Navigator.pop(context);
          }, // null 会禁用 button
        ),
        title: Text('Default App Bar'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
        child: Column(
          children: <Widget>[
            new Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey),
                child: Center(
                  child: Text('title'),
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                child: Text('sub title'),
                decoration: BoxDecoration(color: Colors.black26),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black38,
                child: Text('third text'),
              ),
              flex: 1,
            ),
            Container(
              color: Colors.black45,
              child: Text('third text'),
            ),
          ],
        ),
      ),
    );
  }
}
