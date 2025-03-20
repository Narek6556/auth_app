// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => AppInfo(
      id: json['id'] as String?,
      is_user_logged_in: (json['is_user_logged_in'] as num).toInt(),
      is_dark_mode: (json['is_dark_mode'] as num).toInt(),
    );

Map<String, dynamic> _$AppInfoToJson(AppInfo instance) => <String, dynamic>{
      'id': instance.id,
      'is_user_logged_in': instance.is_user_logged_in,
      'is_dark_mode': instance.is_dark_mode,
    };
