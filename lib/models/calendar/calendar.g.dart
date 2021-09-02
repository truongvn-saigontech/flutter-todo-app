// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarV2 _$CalendarV2FromJson(Map<String, dynamic> json) {
  return CalendarV2(
    eventName: json['eventName'] as String,
    from: const DateTimeSerializer().fromJson(json['from'] as String),
    to: const DateTimeSerializer().fromJson(json['to'] as String),
    background: const ColorSerialiser().fromJson(json['background'] as int),
    isAllDay: json['isAllDay'] as bool,
    subTask: json['subTask'] as String?,
  );
}

Map<String, dynamic> _$CalendarV2ToJson(CalendarV2 instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'subTask': instance.subTask,
      'from': const DateTimeSerializer().toJson(instance.from),
      'to': const DateTimeSerializer().toJson(instance.to),
      'background': const ColorSerialiser().toJson(instance.background),
      'isAllDay': instance.isAllDay,
    };
