import 'package:flutter/material.dart';

class HomepageMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  _handleClick("无状态");
                },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text(
                      '无状态',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ))),
            GestureDetector(
              onTap: (){
                _handleClick("有状态");
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  '有状态',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _handleClick(String actionName) {
    print("action name : " + actionName);
  }
}
