import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class WidgetUtils {
  EdgeInsets getButtonPadding(WidgetInfo widgetInfo) {
    return EdgeInsets.fromLTRB(
      widgetInfo.widgetLayout.padding.left,
      widgetInfo.widgetLayout.padding.top,
      widgetInfo.widgetLayout.padding.right,
      widgetInfo.widgetLayout.padding.bottom,
    );
  }
}
