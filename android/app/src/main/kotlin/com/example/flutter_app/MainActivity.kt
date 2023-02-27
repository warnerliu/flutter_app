package com.example.flutter_app

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    var methodChannel: MethodChannel? = null
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        NativeMethodForFlutter(flutterEngine.dartExecutor);
    }
}
