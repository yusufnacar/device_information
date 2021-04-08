import 'dart:async';

import 'package:device_info/models/android_info.dart';
import 'package:device_info/models/ios_info.dart';
import 'package:flutter/services.dart';

class DeviceService {
  static const platform = const MethodChannel('samples.flutter.dev/deviceInfo');

  Future<AndroidInfo> getAndroidInfo() async {
    try {
      var result = await platform.invokeMethod('getDeviceInfos');

      return AndroidInfo.fromJson(result);
    } on PlatformException catch (e) {
      print("Couldn't get device information ${e.message}");
      throw e;
    }
  }

  Future<IosInfo> getIosInfo() async {
    try {
      var result = await platform.invokeMethod('getDeviceInfos');

      return IosInfo.fromJson(result);
    } on PlatformException catch (e) {
      print("Couldn't get device information ${e.message}");
      throw e;
    }
  }
}
