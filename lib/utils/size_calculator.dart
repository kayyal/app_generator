import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class SizeCalculator extends GetxController {
  double calculateWidth(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsoluteSize
        ? widgetInfo.widgetLayout.width
        : widgetInfo.widgetLayout.width * MediaQuery.of(context).size.width;
  }

  double calculateHeight(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsoluteSize
        ? widgetInfo.widgetLayout.height
        : widgetInfo.widgetLayout.height * MediaQuery.of(context).size.height;
  }
}
