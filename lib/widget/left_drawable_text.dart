import 'package:flutter/material.dart';

class LeftDrawableText extends StatefulWidget {
  final String assertIcon;
  final String text;
  final Function backPress;

  LeftDrawableText(this.assertIcon, this.text, this.backPress);

  @override
  State<StatefulWidget> createState() {
    return _LeftDrawableTextState();
  }
}

class _LeftDrawableTextState extends State<LeftDrawableText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
//      decoration: BoxDecoration(color: Colors.black26),
        child: Row(
          children: <Widget>[
            Container(
              width: 30,
//            decoration: BoxDecoration(color: Colors.amberAccent),
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                tooltip: 'Navigation menu',
                onPressed: null, // null 会禁用 button
              ),
            ),
            Container(
//            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
//            decoration: BoxDecoration(color: Colors.red),
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      onTap: widget.backPress,
    );
  }
}
