import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/helpers/time.helper.dart';

class DateTimeSerializer implements JsonConverter<DateTime, String> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(String json) {
    parseTimeStringToTimeOfDay(json);
    return DateTime.now();
  }

  @override
  String toJson(DateTime color) => color.toString();
}
