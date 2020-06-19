import 'package:flutter/material.dart';
import 'package:flutter_app/default_page.dart';
import 'package:flutter_app/custom_app_bar_page.dart';

class HomepageMenu extends StatelessWidget {
  _handleClick(String actionName, BuildContext buildContext) {
    print("action name : " + actionName);
    Widget pageWidget = DefaultPage();
    switch (actionName) {
      case _MenuItemsName.STATELESS:
        break;
      case _MenuItemsName.STATEFUL:
        break;
      case _MenuItemsName.APPBAR:
        pageWidget = CustomAppBarPage();
        break;
      case _MenuItemsName.DEFAULTAPPBAR:
        break;
    }
    Navigator.of(buildContext).push(new MaterialPageRoute(
      builder: (context) {
        return pageWidget;
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  _handleClick(_MenuItemsName.STATELESS, context);
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text(
                      _MenuItemsName.STATELESS,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ))),
            GestureDetector(
              onTap: () {
                _handleClick(_MenuItemsName.STATEFUL, context);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  _MenuItemsName.STATEFUL,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _handleClick(_MenuItemsName.APPBAR, context);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  _MenuItemsName.APPBAR,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _handleClick(_MenuItemsName.DEFAULTAPPBAR, context);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  _MenuItemsName.DEFAULTAPPBAR,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MenuItemsName {
  static const String STATELESS = '无状态';
  static const String STATEFUL = '有状态';
  static const String ROUTER = '路由使用';
  static const String APPBAR = '自定义状态栏';
  static const String DEFAULTAPPBAR = '默认状态栏';
}