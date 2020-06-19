import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../cell_model.dart';

class StatefulWordList extends StatefulWidget {
  @override
  createState() => new WordListState();
}

class WordListState extends State<StatefulWordList> {
  final _suggestions = <CellModel>[];
  final _saved = Set<CellModel>();
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
  );

  Widget _buildSuggestions() {
    return new ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            generateWordPairs().take(10).forEach((element) {
              _suggestions.add(CellModel.nameAndAge(element.asCamelCase, 18));
            });
          }
          return _buildRow(_suggestions[index], i);
        });
  }

  Widget _buildRow(CellModel pair, int index) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.name + '_' + pair.address + ':' + index.toString(),
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.name,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}