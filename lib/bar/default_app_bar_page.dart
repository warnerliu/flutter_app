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
        height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
        child: Row(
          children: <Widget>[
            new Expanded(
              child: Container(
                height: 28,
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
              child: Text('sub title'),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
