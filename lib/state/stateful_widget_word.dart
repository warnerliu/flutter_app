import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class StatefulRandomWordWidget extends StatefulWidget {
  @override
  createState() => new RandomWordState();
}

class RandomWordState extends State<StatefulRandomWordWidget> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'welcome',
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text('Stateful'),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
