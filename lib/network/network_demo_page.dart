import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'future_data_process.dart';

class DisplayNetworkDataDemo extends StatefulWidget {
  @override
  createState() => _DisplayNetworkState();
}

class _DisplayNetworkState extends State<DisplayNetworkDataDemo> {
  FutureDataProcess process = FutureDataProcess();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('网络请求'),
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            /*表示数据成功返回*/
            if (snapshot.hasData) {
              Response response = snapshot.data;
              return Text('${response.data.toString()}');
            } else {
              return Text('loading data');
            }
          },
          future: process.postRequest(),
        ));
  }
}
