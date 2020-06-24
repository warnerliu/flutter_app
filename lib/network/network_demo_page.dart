import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/custom_app_bar.dart';

class DisplayNetworkDataDemo extends StatefulWidget {
  @override
  createState() => _DisplayNetworkState();
}

class _DisplayNetworkState extends State<DisplayNetworkDataDemo> {

  String rsp;
  void getRequest() async {
    Dio dio = new Dio();
    var response = await dio.get("/test?id=12&name=chen");
//    var response = await dio.get("/test"，data:{"id":12,"name":"chen"});
    rsp = response.data.toString();
  }

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
      body: Container(
        child: Text('test'),
      ),
    );
  }
}
