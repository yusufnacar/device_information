// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ios_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IosInfo _$IosInfoFromJson(Map<dynamic, dynamic> json) {
  return IosInfo(
    json['device'] as String,
    json['model'] as String,
    json['description'] as String,
    json['system'] as String,
    json['version'] as String,
    json['localizedModel'] as String,
  );
}

Map<dynamic, dynamic> _$IosInfoToJson(IosInfo instance) => <dynamic, dynamic>{
      'device': instance.name,
      'model': instance.model,
      'description': instance.description,
      'system': instance.systemName,
      'version': instance.systemVersion,
      'localizedModel': instance.localizedModel,
    };
