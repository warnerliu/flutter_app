package com.example.flutter_app

import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


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
            else -> p1.notImplemented()
        }
    }

    private fun getDataFromNative(): DataModel {
        return DataModel()
    }
}