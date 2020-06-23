import 'package:flutter/material.dart';

class CommonScrollView extends StatelessWidget {
  final double ITEM_WIDTH = double.infinity;
  final double ITEM_HEIGHT = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter滚动组件'),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: ITEM_HEIGHT,
                    width: ITEM_WIDTH,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text(
                      '_MenuItemsName.STATELESS',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ))),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: ITEM_HEIGHT,
                width: ITEM_WIDTH,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  '_MenuItemsName.STATEFUL',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: ITEM_HEIGHT,
                width: ITEM_WIDTH,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  '_MenuItemsName.APPBAR',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: ITEM_HEIGHT,
                width: ITEM_WIDTH,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: ITEM_HEIGHT,
                width: ITEM_WIDTH,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  '',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
