// ignore: depend_on_referenced_packages
import 'package:gold_cherry_app_generator/widget/alignment_to_parent.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:gold_cherry_app_generator/widget_type.dart';

import '../text/text_info.dart';
import 'widget_image.dart';
import 'widget_layout.dart';
import 'widget_style.dart';

part 'widget_info.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class WidgetInfo {
  final String key;
  WidgetLayout widgetLayout;
  WidgetStyle widgetStyle;
  TextInfo? textInfo;
  WidgetImage? image;
  AlignmentToParent? alignedWithParent;
  List<WidgetInfo>? children;
  final WidgetType widgetType;
  // button up  / for figureing out the touchable info

  WidgetInfo({
    required this.key,
    required this.widgetLayout,
    required this.widgetStyle,
    this.textInfo,
    this.children,
    this.alignedWithParent,
    required this.widgetType,
  });

  factory WidgetInfo.fromJson(Map<String, dynamic> json) =>
      _$WidgetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WidgetInfoToJson(this);
}
