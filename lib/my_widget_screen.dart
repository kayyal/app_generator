import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/json_string.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/text/text_style_info.dart';

class MyWidgetScreen extends StatelessWidget {
  final String jsonString = JsonString.nestedJson4;

  @override
  Widget build(BuildContext context) {
    List<WidgetInfo> widgetInfos = parseWidgets(jsonString);
    List<Widget> flutterWidgets = createFlutterWidgets(widgetInfos);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: flutterWidgets,
        ),
      ),
    );
  }

  List<WidgetInfo> parseWidgets(String jsonString) {
    final parsedMap = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsedMap
        .map<WidgetInfo>((json) => WidgetInfo.fromJson(json))
        .toList();
  }
}

Widget createWidget(WidgetInfo widgetInfo) {
  Alignment alignment =
      widgetInfo.alignedWithParent?.toAlignment() ?? Alignment.center;
  print("alignment >>> ${alignment}");
  return Positioned(
    left: widgetInfo.widgetLayout.dx,
    top: widgetInfo.widgetLayout.dy,
    width: widgetInfo.widgetLayout.width,
    height: widgetInfo.widgetLayout.height,
    child: Container(
      width: widgetInfo.widgetLayout.width,
      height: widgetInfo.widgetLayout.height,
      alignment: alignment,
      decoration: BoxDecoration(
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
          bottomRight:
              Radius.circular(widgetInfo.widgetStyle.corner.bottomRight),
        ),
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
      ),
      child: widgetInfo.textInfo != null
          ? Stack(children: [
              Text(
                widgetInfo.textInfo!.content.text,
                style: TextStyle(
                  color: Color.fromRGBO(
                    widgetInfo.textInfo!.style.color.r,
                    widgetInfo.textInfo!.style.color.g,
                    widgetInfo.textInfo!.style.color.b,
                    1.0,
                  ),
                  fontSize: widgetInfo.textInfo!.style.size,
                  fontWeight:
                      calculateFontWeight(widgetInfo.textInfo!.style.weight),
                  decoration: widgetInfo.textInfo!.style.underline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ])
          : null,
    ),
  );
}

List<Widget> createFlutterWidgets(List<WidgetInfo> widgetInfos) {
  List<Widget> widgets = [];

  for (var widgetInfo in widgetInfos) {
    Widget widget = createWidget(widgetInfo);

    if (widgetInfo.children != null) {
      List<Widget> nestedWidgets = createFlutterWidgets(widgetInfo.children!);
      widget = Stack(
        children: [
          widget,
          ...nestedWidgets,
        ],
      );
    }

    widgets.add(widget);
  }

  return widgets;
}
