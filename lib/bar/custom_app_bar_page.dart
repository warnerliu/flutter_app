import 'package:flutter/material.dart';
import 'package:flutter_app/widget/custom_app_bar.dart';
import 'package:flutter_app/widget/left_drawable_text.dart';

class CustomAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Scaffold(
      appBar: new CustomAppBar(
        title: 'custome',
        leadingWidget: new LeftDrawableText("assertIcon", "返回", () {
          print('传入方法参数');
          Navigator.pop(context);
        }),
      ),
      // Column is 垂直方向的线性布局.
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
          new Expanded(
              child: Image(
            image: AssetImage("images/icon_left_arrow.png"),
            width: 100,
          ))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
