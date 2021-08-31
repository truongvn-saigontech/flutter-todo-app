// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    taskname: json['taskname'] as String,
    subtask: json['subtask'] as String,
    startTime: json['startTime'] as String,
    endTime: json['endTime'] as String?,
    id: json['id'] as String?,
    status: const ColorSerialiser().fromJson(json['status'] as int),
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskname': instance.taskname,
      'subtask': instance.subtask,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'id': instance.id,
      'status': const ColorSerialiser().toJson(instance.status),
    };
