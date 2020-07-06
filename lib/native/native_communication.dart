import 'package:flutter/services.dart';
import 'package:flutter_app/native/data_model.dart';

class NativeCommunication {
  /// MethodChannel name是一个唯一标记，不重复就好
  static const platform =
      const MethodChannel('com.warner.flutter.test');

  /// 远程调用需要异步操作, 把这个方法生命成 async
  static Future<DataModel> getNativeData() async {
    // 处理异常
    try {
      // getBatteryLevel 是远程方法的名字
      final DataModel result = await platform.invokeMethod('getNativeData');
      return Future.value(result);
    } on PlatformException catch (e) {
      return Future.value(DataModel());
    }
  }
}
