// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../text/text_info.dart';
import 'widget_image.dart';
import 'widget_layout.dart';
import 'widget_style.dart';

part 'widget_info.g.dart';

@JsonSerializable()
@CopyWith()
class WidgetInfo {
  final String key;
  WidgetLayout widgetLayout;
  WidgetStyle widgetStyle;
  TextInfo? textInfo;
  WidgetImage? image;
  List<WidgetInfo>? children;
  // button up  / for figureing out the touchable info

  WidgetInfo(
      {required this.key,
      required this.widgetLayout,
      required this.widgetStyle,
      this.textInfo,
      this.children});

  factory WidgetInfo.fromJson(Map<String, dynamic> json) =>
      _$WidgetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetInfoToJson(this);
}
