import 'package:device_info/UI/components/info_card.dart';
import 'package:device_info/providers/device_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IosInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IOS Info"),
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
                    content: provider.iosInfo.model,
                    type: "Model",
                    iconData: Icons.phone_iphone,
                  ),
                  InfoCard(
                    content: provider.iosInfo.description,
                    type: "Description",
                    iconData: Icons.device_hub,
                  ),
                  InfoCard(
                      content: provider.iosInfo.systemName,
                      type: "System",
                      iconData: Icons.settings_system_daydream),
                  InfoCard(
                    content: provider.iosInfo.systemVersion,
                    type: "Version",
                    iconData: Icons.update,
                  ),
                  InfoCard(
                    content: provider.iosInfo.localizedModel,
                    type: "Localiz Model",
                    iconData: Icons.phone_iphone,
                  ),
                  InfoCard(
                    content: provider.iosInfo.name,
                    type: "Name",
                    iconData: Icons.phone_iphone,
                  ),
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
