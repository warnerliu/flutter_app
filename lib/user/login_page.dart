import 'package:flutter/material.dart';
import 'package:flutter_app/network/future_data_process.dart';

import 'package:flutter_app/user/user_info.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  FutureDataProcess _futureDataProcess = FutureDataProcess();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(20),
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage("images/icon_login.png"),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    color: Colors.grey,
                    child: Text('用户名'),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: TextField(
                        controller: _accountTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '请输入用户名'),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    width: 50,
                    child: Text('密码'),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      color: Colors.blueGrey,
                      child: TextField(
                        obscureText: true,
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '请输入密码'),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _login,
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _login() {
    String account = _accountTextController.text;
    String password = _passwordTextController.text;
    print('user name : ' + account);
    print('password : ' + password);
    Future<User> rsp = _futureDataProcess.asyncLogin(account, password);
    // 使用箭头函数的时候，多行语句只能用,换行分隔
//    rsp.then((value) => {
//          print('login rsp : $value'),
//          print('login success, then do something'),
//      // json to object
//        });
    rsp.then((value) {
      print('convert model : ' + value.userName);
    });
  }
}
