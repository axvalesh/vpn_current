// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      seen: json['seen'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'seen': instance.seen,
    };
