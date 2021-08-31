import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class UidSerialiser implements JsonConverter<Color, int> {
  const UidSerialiser();

  @override
  String fromJson(Uuid json) => Uuid(json);

  @override
  int toJson(Color color) => color.value;
}
