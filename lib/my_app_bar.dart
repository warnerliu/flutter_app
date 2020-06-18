import 'package:flutter/material.dart';
import 'package:flutter_app/widget/custom_app_bar.dart';
import 'package:flutter_app/widget/left_drawable_text.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title, this.subTitle});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;
  final Widget subTitle;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.lightBlueAccent),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              ),
              child: title,
            ),
            flex: 1,
          ),
          Expanded(
            child: subTitle,
            flex: 1,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//          icon: new Icon(Icons.menu),
//          tooltip: 'Navigation menu',
//          onPressed: null,
//        ),
//        title: new Text('Example title'),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//        backgroundColor: Colors.blue,
//      ),
      appBar: new CustomAppBar(
        title: 'custome',
        leadingWidget: new LeftDrawableText("assertIcon", "返回"),
      ),
      // Column is 垂直方向的线性布局.
      body: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
            subTitle: new Text(
              'sub title',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ),
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
