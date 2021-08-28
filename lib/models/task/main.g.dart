// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    json['taskname'] as String,
    json['subtask'] as String,
    json['tasktime'] as String,
    const ColorSerialiser().fromJson(json['status'] as int),
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskname': instance.taskname,
      'subtask': instance.subtask,
      'tasktime': instance.tasktime,
      'status': const ColorSerialiser().toJson(instance.status),
    };
