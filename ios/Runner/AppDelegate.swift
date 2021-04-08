import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceInfo = FlutterMethodChannel(name: "samples.flutter.dev/deviceInfo",
                                              binaryMessenger: controller.binaryMessenger)
    deviceInfo.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        deviceInfo.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          
          guard call.method == "getDeviceInfos" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.getDeviceInfo(result: result)
        })

    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    
    
    private func getDeviceInfo(result : FlutterResult) {
    
      let device = UIDevice.current
        
        
        let deviceInfos: [String: Any] = [
            "device": device.name,
            "model": device.model,
            "description" : device.description,
            "system" : device.systemName,
            "version" : device.systemVersion,
            "localizedModel" : device.localizedModel]
        result(deviceInfos)
    }
}
