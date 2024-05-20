import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class PositionCalculator extends GetxController {
  double calculateLeft(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dx
        : widgetInfo.widgetLayout.dx * MediaQuery.of(context).size.width;
  }

  double calculateTop(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dy
        : widgetInfo.widgetLayout.dy * MediaQuery.of(context).size.height;
  }
}
