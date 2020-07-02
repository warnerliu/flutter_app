import 'package:flutter/material.dart';
import 'package:flutter_app/bar/custom_app_bar_page.dart';
import 'package:flutter_app/bar/default_app_bar_page.dart';
import 'package:flutter_app/default_page.dart';
import 'package:flutter_app/lifecycle.dart';
import 'package:flutter_app/network/network_demo_page.dart';
import 'package:flutter_app/scroll/common_scroll_view.dart';
import 'package:flutter_app/state/click_count_page.dart';
import 'package:flutter_app/state/hello_word_page.dart';
import 'package:flutter_app/state/stateful_widget_list.dart';
import 'package:flutter_app/user/login_page.dart';

class HomepageMenu extends StatelessWidget {
  List<String> menuList = List<String>();

  _handleClick(String actionName, BuildContext buildContext) {
    print("action name : " + actionName);
    Widget pageWidget = DefaultPage();
    switch (actionName) {
      case _MenuItemsName.STATELESS:
        pageWidget = HelloWorldPage();
        break;
      case _MenuItemsName.STATEFUL:
        pageWidget = ClickCountPage();
        break;
      case _MenuItemsName.APPBAR:
        pageWidget = CustomAppBarPage();
        break;
      case _MenuItemsName.DEFAULT_APPBAR:
        pageWidget = DefaultAppBarPage();
        break;
      case _MenuItemsName.LIST_VIEW:
        pageWidget = StatefulWordList();
        break;
      case _MenuItemsName.COMMON_SCROLL_VIEW:
        pageWidget = CommonScrollView();
        break;
      case _MenuItemsName.NETWORK:
        pageWidget = DisplayNetworkDataDemo();
        break;
      case _MenuItemsName.LOGIN:
        pageWidget = LoginPage();
        break;
      case _MenuItemsName.LIFECYCLE:
        pageWidget = LifecycleExample();
        break;
    }
    Navigator.of(buildContext).push(new MaterialPageRoute(
      builder: (context) {
        return pageWidget;
      },
    ));
  }

  Widget _menuListView() {
    return ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return _buildRow(context, index);
        });
  }

  Widget _buildRow(BuildContext context, int index) {
    String menuName = menuList[index];
    return GestureDetector(
        onTap: () {
          _handleClick(menuName, context);
        },
        child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            height: 40,
            width: 100,
            decoration: BoxDecoration(color: Colors.grey),
            child: Text(
              menuName,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )));
  }

  Widget _rawScrollView(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
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
              _handleClick(_MenuItemsName.DEFAULT_APPBAR, context);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 40,
              width: 100,
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Text(
                _MenuItemsName.DEFAULT_APPBAR,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _handleClick(_MenuItemsName.LIST_VIEW, context);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 40,
              width: 100,
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Text(
                _MenuItemsName.LIST_VIEW,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: _menuListView(),
    );
  }

  HomepageMenu() {
    menuList.add(_MenuItemsName.STATELESS);
    menuList.add(_MenuItemsName.STATEFUL);
    menuList.add(_MenuItemsName.APPBAR);
    menuList.add(_MenuItemsName.DEFAULT_APPBAR);
    menuList.add(_MenuItemsName.LIST_VIEW);
    menuList.add(_MenuItemsName.COMMON_SCROLL_VIEW);
    menuList.add(_MenuItemsName.NETWORK);
    menuList.add(_MenuItemsName.LOGIN);
    menuList.add(_MenuItemsName.LIFECYCLE);
  }
}

class _MenuItemsName {
  static const String STATELESS = '无状态';
  static const String STATEFUL = '计数器';
  static const String APPBAR = '自定义状态栏';
  static const String DEFAULT_APPBAR = '默认状态栏';
  static const String LIST_VIEW = 'ListView列表';
  static const String COMMON_SCROLL_VIEW = '普通滚动列表';
  static const String NETWORK = '网络请求';
  static const String LOGIN = 'Login';
  static const String LIFECYCLE = '生命周期';
}
