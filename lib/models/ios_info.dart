import 'package:json_annotation/json_annotation.dart';

part 'ios_info.g.dart';

@JsonSerializable()
class IosInfo {
  final String name;
  final String model;
  final String description;
  final String systemName;
  final String systemVersion;
  final String localizedModel;

  IosInfo(this.name, this.model, this.description, this.systemName,
      this.systemVersion, this.localizedModel);

  factory IosInfo.fromJson(Map<dynamic, dynamic> json) =>
      _$IosInfoFromJson(json);

  Map<dynamic, dynamic> toJson() => _$IosInfoToJson(this);
}
