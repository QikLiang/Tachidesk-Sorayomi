// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateStatus _$$_UpdateStatusFromJson(Map<String, dynamic> json) =>
    _$_UpdateStatus(
      pending: (json['PENDING'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      running: (json['RUNNING'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: (json['COMPLETE'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      failed: (json['FAILED'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UpdateStatusToJson(_$_UpdateStatus instance) =>
    <String, dynamic>{
      'PENDING': instance.pending?.map((e) => e.toJson()).toList(),
      'RUNNING': instance.running?.map((e) => e.toJson()).toList(),
      'COMPLETE': instance.completed?.map((e) => e.toJson()).toList(),
      'FAILED': instance.failed?.map((e) => e.toJson()).toList(),
    };
