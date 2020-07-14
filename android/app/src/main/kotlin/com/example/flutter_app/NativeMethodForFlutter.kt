package com.example.flutter_app

import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.JSONMessageCodec
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject


/**
 * Created by warner on 2020/7/6.
 */
class NativeMethodForFlutter(dartExecutor: DartExecutor) : MethodChannel.MethodCallHandler {
    private val CHANNEL = "com.warner.flutter.test"

    init {
        MethodChannel(dartExecutor, CHANNEL).setMethodCallHandler(this)
    }

    override fun onMethodCall(p0: MethodCall, p1: MethodChannel.Result) {

        val method: String = p0.method
        when (method) {
            "getNativeData" -> p1.success("hello")
            "getParams" -> {
                val msg: String? = p0.argument("msg")
                println("get params value from native : $msg")
                val data = DataModel()
                println("data model : $data")
                val jsonObj = JSONObject()
                jsonObj.put("name","json obj")
                // TODO 这种类型的处理不了啊
                val map:HashMap<String, String> = HashMap()
                map["name"] = "map test"
                p1.success(map)
//                p1.success("test")
            }
            else -> p1.notImplemented()
        }
    }

    private fun getDataFromNative(): DataModel {
        return DataModel()
    }
}