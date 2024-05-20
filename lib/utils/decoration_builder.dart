import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class DecorationBuilder extends GetxController {
  BoxDecoration build(WidgetInfo widgetInfo) {
    return BoxDecoration(
      color: Color.fromRGBO(
        widgetInfo.widgetStyle.color.r,
        widgetInfo.widgetStyle.color.g,
        widgetInfo.widgetStyle.color.b,
        widgetInfo.widgetStyle.color.opacity,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(widgetInfo.widgetStyle.corner.topLeft),
        topRight: Radius.circular(widgetInfo.widgetStyle.corner.topRight),
        bottomLeft: Radius.circular(widgetInfo.widgetStyle.corner.bottomLeft),
        bottomRight: Radius.circular(widgetInfo.widgetStyle.corner.bottomRight),
      ),
      // the borderColor must be added to the widgetStyle
      // border: Border.all(
      //   color: Color.fromRGBO(
      //     widgetInfo.widgetStyle.borderColor.r,
      //     widgetInfo.widgetStyle.borderColor.g,
      //     widgetInfo.widgetStyle.borderColor.b,
      //     widgetInfo.widgetStyle.borderColor.opacity,
      //   ),
      //   width: widgetInfo.widgetStyle.borderWidth,
      // ),
      boxShadow: widgetInfo.widgetStyle.shadows.map((shadow) {
        return BoxShadow(
          color: Color.fromRGBO(
            shadow.color.r,
            shadow.color.g,
            shadow.color.b,
            shadow.color.opacity,
          ),
          offset: Offset(shadow.offsetX, shadow.offsetY),
          blurRadius: shadow.blurRadius,
          spreadRadius: shadow.spreadRadius,
        );
      }).toList(),
    );
  }
}
