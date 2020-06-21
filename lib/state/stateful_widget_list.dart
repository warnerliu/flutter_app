import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../cell_model.dart';

class StatefulWordList extends StatefulWidget {
  @override
  createState() => WordListState();
}

class WordListState extends State<StatefulWordList> {
  final _suggestions = <CellModel>[];
  final _saved = Set<CellModel>();
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
  );

  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, i) {
          if (i >= _suggestions.length) {
            generateWordPairs().take(10).forEach((element) {
              _suggestions.add(CellModel.nameAndAge(element.asCamelCase, 18));
            });
          }
          return _buildRow(_suggestions[i], i);
        });
  }

  Widget _buildRow(CellModel pair, int index) {
    final alreadySaved = _saved.contains(pair);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            pair.name + '_' + pair.address + ':' + index.toString(),
            style: _biggerFont,
          ),
          trailing: Icon(
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
        ),
        Divider(),
      ],
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
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
          return Scaffold(
            appBar: AppBar(
              title: Text('收藏列表'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView列表'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
