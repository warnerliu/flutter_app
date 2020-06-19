import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            tooltip: 'Navigation menu',
            onPressed: () {
              Navigator.pop(context);
            }, // null 会禁用 button
          ),
          title: new Text('unimplement page'),
        ),
        body: new Center(
          child: new Text(
            '默认页面',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                backgroundColor: Colors.grey),
          ),
        ),
      ),
    );
  }
}
