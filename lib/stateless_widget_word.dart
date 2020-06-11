import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'welcome',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('bar title'),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
