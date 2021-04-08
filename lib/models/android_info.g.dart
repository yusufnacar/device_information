// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidInfo _$AndroidInfoFromJson(Map<dynamic, dynamic> json) {
  return AndroidInfo(
    json['brand'] as String,
    json['board'] as String,
    json['bootLoader'] as String,
    json['device'] as String,
    json['display'] as String,
    json['hardware'] as String,
    json['host'] as String,
    json['id'] as String,
    json['manufacturer'] as String,
    json['model'] as String,
    json['product'] as String,
    json['battery_level'] as String,
  );
}

Map<dynamic, dynamic> _$AndroidInfoToJson(AndroidInfo instance) =>
    <dynamic, dynamic>{
      'brand': instance.brand,
      'board': instance.board,
      'bootLoader': instance.bootLoader,
      'device': instance.device,
      'display': instance.display,
      'hardware': instance.hardware,
      'host': instance.host,
      'id': instance.id,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'product': instance.product,
      'battery_level': instance.batteryLevel,
    };
