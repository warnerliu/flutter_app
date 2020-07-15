import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/mvvm_model.dart';
import 'package:flutter_app/mvvm/view_model_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel _viewModel;

  @override
  void initState() {
    super.initState();
    // 获取viewModel有问题
    _viewModel = ViewModelProvider.of(context);
    _viewModel.init(context);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            tooltip: 'Navigation menu',
            onPressed: () {
              Navigator.pop(context);
            }, // null 会禁用 button
          ),
          title: new Text('MVVM示例'),
        ),
        body: new Center(
            child: GestureDetector(
          onTap: () {
            print("click to refresh data");
            _viewModel.refreshData(context);
          },
          child: Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 50, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  FutureBuilder(
                    future: _viewModel.refreshData(context),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Text('${snapshot.data}');
                    },
                  )
                ],
              )),
        )),
      ),
    );
  }
}
