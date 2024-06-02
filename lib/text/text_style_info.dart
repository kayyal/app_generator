// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'text_rgb_color.dart';

part 'text_style_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith(copyWithNull: true)
class TextStyleInfo {
  final TextRGBColor color;
  final double size;
  final double weight;
  final bool underline;

  TextStyleInfo(
      {required this.color,
      required this.size,
      required this.weight,
      required this.underline});

  factory TextStyleInfo.fromJson(Map<String, dynamic> json) =>
      _$TextStyleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TextStyleInfoToJson(this);
}
