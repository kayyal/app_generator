import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/screens/main_screen.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class WidgetBuilderr {
  static List<Widget> createFlutterWidgets(
      List<WidgetInfo> widgetInfos, BuildContext context) {
    List<Widget> widgets = [];
    for (var widgetInfo in widgetInfos) {
      Widget widget = createWidget(widgetInfo, context);
      widgets.add(widget);
    }
    return widgets;
  }

  static Widget createWidget(WidgetInfo widgetInfo, BuildContext context) {
    return Positioned(
      left: _calculateLeft(widgetInfo, context),
      top: _calculateTop(widgetInfo, context),
      child: _buildContainer(widgetInfo, context),
    );
  }

  static double _calculateLeft(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dx
        : widgetInfo.widgetLayout.dx * MediaQuery.of(context).size.width;
  }

  static double _calculateTop(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dy
        : widgetInfo.widgetLayout.dy * MediaQuery.of(context).size.height;
  }

  static Widget _buildContainer(WidgetInfo widgetInfo, BuildContext context) {
    return Container(
      width: _calculateWidth(widgetInfo, context),
      height: _calculateHeight(widgetInfo, context),
      alignment: _calculateAlignment(widgetInfo),
      decoration: _buildDecoration(widgetInfo),
      child: Stack(
        children: <Widget>[
          if (widgetInfo.textInfo != null)
            Container(
              alignment: _calculateAlignment(widgetInfo),
              child: TextBuilder.buildTextWidget(widgetInfo.textInfo),
            ),
          if (widgetInfo.children != null)
            Stack(
              children: <Widget>[
                ...createFlutterWidgets(widgetInfo.children!, context),
              ],
            ),
        ],
      ),
    );
  }

  static double _calculateWidth(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsoluteSize
        ? widgetInfo.widgetLayout.width
        : widgetInfo.widgetLayout.width * MediaQuery.of(context).size.width;
  }

  static double _calculateHeight(WidgetInfo widgetInfo, BuildContext context) {
    return widgetInfo.widgetLayout.isAbsoluteSize
        ? widgetInfo.widgetLayout.height
        : widgetInfo.widgetLayout.height * MediaQuery.of(context).size.height;
  }

  static Alignment _calculateAlignment(WidgetInfo widgetInfo) {
    return widgetInfo.alignedWithParent?.toAlignment() ?? Alignment.center;
  }

  static BoxDecoration _buildDecoration(WidgetInfo widgetInfo) {
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
      boxShadow: _buildBoxShadows(widgetInfo),
    );
  }

  static List<BoxShadow> _buildBoxShadows(WidgetInfo widgetInfo) {
    return widgetInfo.widgetStyle.shadows.map((shadow) {
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
    }).toList();
  }
}
