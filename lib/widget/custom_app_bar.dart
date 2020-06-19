import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight; //从外部指定高度
  final Color navigationBarBackgroundColor; //设置导航栏背景的颜色
  final Widget leadingWidget;
  final Widget trailingWidget;
  final String title;

  CustomAppBar({
    this.leadingWidget,
    @required this.title,
    this.contentHeight = 44,
    this.navigationBarBackgroundColor = Colors.blue,
    this.trailingWidget,
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return CustomAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(this.contentHeight);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.navigationBarBackgroundColor,
      child: new SafeArea(
        top: true,
        child: new Container(
            decoration: BoxDecoration(
//              borderSide: BorderSide(width: 1.0, color: Color(0xffff0000)),
            color: Colors.lightBlue
            ),
            height: widget.contentHeight,
            child: new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: new Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: widget.leadingWidget,
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: new Text(widget.title,
                      style: new TextStyle(
                          fontSize: 17, color: Color(0xff000000))),
                ),
                Positioned(
                  right: 0,
                  child: new Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: widget.trailingWidget,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
