import 'package:device_info/providers/device_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/screens/device_info_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeviceInfoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Info',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.white38,
      ),
      home: DeviceInfoScreen(),
    );
  }
}
