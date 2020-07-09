import 'package:flutter/services.dart';
import 'package:flutter_app/native/data_model.dart';

class NativeCommunication {
  /// MethodChannel name是一个唯一标记，不重复就好
  static const platform = const MethodChannel('com.warner.flutter.test');

  /// 远程调用需要异步操作, 把这个方法生命成 async
  static Future<String> getNativeData() async {
    // 处理异常
    try {
      // getBatteryLevel 是远程方法的名字
      final String result = await platform.invokeMethod('getNativeData');
      return Future.value(result);
    } on PlatformException catch (e) {
      return Future.value(e.toString());
    }
  }

  // 调用native方法，并传递参数
  static Future<String> getValueWithParams() async {
    try {
      final String result = await platform
          .invokeMethod('getParams', {"msg": "hello params from flutter"});
      print('********** callback **********');
      print('get value callback with params : ' + result.toString());
      return Future.value(result);
    } on PlatformException catch (e) {
      return Future.value("JSONMessageCodec()");
    }
  }
}
