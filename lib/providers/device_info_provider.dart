import 'dart:async';

import 'package:device_info/models/android_info.dart';
import 'package:device_info/models/ios_info.dart';
import 'package:device_info/service/device_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

enum DeviceProviderStatus {
  Initial,
  Loading,
  Success,
  Error,
}

class DeviceInfoProvider with ChangeNotifier {
  AndroidInfo _androidInfo;
  IosInfo _iosInfo;
  DeviceService _deviceService = DeviceService();

  DeviceProviderStatus _status = DeviceProviderStatus.Initial;

  AndroidInfo get androidInfo => _androidInfo;
  IosInfo get iosInfo => _iosInfo;

  DeviceProviderStatus get status => _status;

  Future<void> getAndroidInfo() async {
    try {
      _updateStatus(DeviceProviderStatus.Loading);
      _androidInfo = await _deviceService.getAndroidInfo();
      _updateStatus(DeviceProviderStatus.Success);
    } catch (e) {
      _updateStatus(DeviceProviderStatus.Error);
    }
  }

  Future<void> getIosInfo() async {
    try {
      _updateStatus(DeviceProviderStatus.Loading);
      _iosInfo = await _deviceService.getIosInfo();
      _updateStatus(DeviceProviderStatus.Success);
    } catch (e) {
      _updateStatus(DeviceProviderStatus.Error);
    }
  }

  void _updateStatus(DeviceProviderStatus status) {
    if (_status != status) {
      developer
          .log('DeviceInfoProvider: Status updated from: $_status to: $status');
      _status = status;
      notifyListeners();
    }
  }
}
