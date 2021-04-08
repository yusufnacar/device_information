import 'package:json_annotation/json_annotation.dart';

part 'android_info.g.dart';

@JsonSerializable()
class AndroidInfo {
  final String brand;
  final String board;
  final String bootLoader;
  final String device;
  final String display;
  final String hardware;
  final String host;
  final String id;
  final String manufacturer;
  final String model;
  final String product;
  @JsonKey(name: 'battery_level')
  final String batteryLevel;

  AndroidInfo(
      this.brand,
      this.board,
      this.bootLoader,
      this.device,
      this.display,
      this.hardware,
      this.host,
      this.id,
      this.manufacturer,
      this.model,
      this.product,
      this.batteryLevel);

  factory AndroidInfo.fromJson(Map<dynamic, dynamic> json) =>
      _$AndroidInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AndroidInfoToJson(this);
}
