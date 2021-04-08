import 'dart:io';

import 'package:device_info/providers/device_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'android_info_screen.dart';
import 'ios_info_screen.dart';

class DeviceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DeviceInfoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Device Doc')),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Get Device Info'),
            onPressed: () {
              if (Platform.isAndroid) {
                provider.getAndroidInfo();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AndroidInfoScreen()));
              } else if (Platform.isIOS) {
                provider.getIosInfo();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => IosInfoScreen()));
              }
            }),
      ),
    );
  }
}
