import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class AlignmentCalculator {
  static Alignment calculate(WidgetInfo widgetInfo) {
    return widgetInfo.alignedWithParent?.toAlignment() ?? Alignment.center;
  }
}
