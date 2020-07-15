import 'package:flutter/material.dart';
import 'package:flutter_app/mvvm/base_view_model.dart';

class HomeModel extends BaseViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void doInit(BuildContext context) {
    // TODO: implement doInit
    refreshData(context);
  }

  @override
  Future<String> refreshData(BuildContext context) {
    // TODO: implement refreshData
//    throw UnimplementedError();
    return Future.value("hello");
  }
}
