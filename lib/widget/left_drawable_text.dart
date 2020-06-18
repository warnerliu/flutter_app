import 'package:flutter/material.dart';

class LeftDrawableText extends StatefulWidget {
  String assertIcon;
  String text;

  LeftDrawableText(this.assertIcon, this.text);

  @override
  State<StatefulWidget> createState() {
    return LeftDrawableTextState();
  }
}

class LeftDrawableTextState extends State<LeftDrawableText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black26),
      child: Stack(
        children: <Widget>[
          IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
