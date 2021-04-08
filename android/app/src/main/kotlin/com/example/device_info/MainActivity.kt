package com.example.device_info

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES


class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/deviceInfo"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getDeviceInfos") {
                val deviceInfo = getDeviceInfos()
                result.success(deviceInfo)

            } else {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfos(): Map<String,String> {
        var deviceInfos  =  mutableMapOf<String,String>()


        deviceInfos.put("brand", android.os.Build.BRAND)
        deviceInfos.put("board", android.os.Build.BOARD)
        deviceInfos.put("bootloader", android.os.Build.BOOTLOADER)
        deviceInfos.put("device", android.os.Build.DEVICE)
        deviceInfos.put("display", android.os.Build.DISPLAY)
        deviceInfos.put("hardware", android.os.Build.HARDWARE);
        deviceInfos.put("host", android.os.Build.HOST);
        deviceInfos.put("id", android.os.Build.ID);
        deviceInfos.put("manufacturer", android.os.Build.MANUFACTURER);
        deviceInfos.put("model", android.os.Build.MODEL);
        deviceInfos.put("product", android.os.Build.PRODUCT);

        val batteryLevel = getBatteryLevel()
        if (batteryLevel != -1) {
            deviceInfos.put("battery_level", batteryLevel.toString());
        } else {
            deviceInfos.put("battery_level", "UNAVAILABLE");
        }
        return deviceInfos
    }


    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }

}
