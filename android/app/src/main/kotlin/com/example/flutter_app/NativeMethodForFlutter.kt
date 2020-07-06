package com.example.flutter_app

import android.content.Context
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterView


/**
 * Created by warner on 2020/7/6.
 */
class NativeMethodForFlutter(activity: FlutterActivity) : MethodChannel.MethodCallHandler {
    private val CHANNEL = "com.warner.flutter.test"
    private var mContext: Context? = null

    init {
        val view: FlutterView = activity.flutterView;
        mContext = view.context
        MethodChannel(view, CHANNEL).setMethodCallHandler(this)
    }

    override fun onMethodCall(p0: MethodCall, p1: MethodChannel.Result) {
        TODO("Not yet implemented")
        val method: String = p0.method
        when (method) {
            "getNativeData" -> p1.success(getDataFromNative())
            else -> p1.notImplemented()
        }
    }

    private fun getDataFromNative(): DataModel {
        return DataModel()
    }
}