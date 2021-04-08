import 'package:device_info/UI/components/info_card.dart';
import 'package:device_info/providers/device_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AndroidInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Android Info"),
        ),
        body: Consumer(builder: (context, DeviceInfoProvider provider, _) {
          if (provider.status == DeviceProviderStatus.Loading ||
              provider.status == DeviceProviderStatus.Initial) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.status == DeviceProviderStatus.Success) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InfoCard(
                    content: provider.androidInfo.model,
                    type: "Model",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.board,
                    type: "Board",
                    iconData: Icons.border_all_rounded,
                  ),
                  InfoCard(
                    content: provider.androidInfo.device,
                    type: "Device",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.brand,
                    type: "Brand",
                    iconData: Icons.phone_android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.hardware,
                    type: "Hardware",
                    iconData: Icons.hardware,
                  ),
                  InfoCard(
                    content: provider.androidInfo.host,
                    type: "Host",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.host,
                    type: "Host",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.id,
                    type: "ID",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.manufacturer,
                    type: "Manfact",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.product,
                    type: "Product",
                    iconData: Icons.android,
                  ),
                  InfoCard(
                    content: provider.androidInfo.batteryLevel,
                    type: "Battery",
                    iconData: Icons.battery_std,
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text("We can't reach information of device"),
            );
          }
        }));
  }
}
