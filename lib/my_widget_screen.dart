import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/json_string.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class MyWidgetScreen extends StatelessWidget {
  final String jsonString = JsonString.nestedJson3;

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
  return Positioned(
    left: widgetInfo.widgetLayout.dx,
    top: widgetInfo.widgetLayout.dy,
    width: widgetInfo.widgetLayout.width,
    height: widgetInfo.widgetLayout.height,
    child: Container(
      width: widgetInfo.widgetLayout.width,
      height: widgetInfo.widgetLayout.height,
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
          ? Center(
              child: Text(
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
            )
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

FontWeight calculateFontWeight(double weight) {
  if (weight <= 100) {
    return FontWeight.w100;
  } else if (weight <= 200) {
    return FontWeight.w200;
  } else if (weight <= 300) {
    return FontWeight.w300;
  } else if (weight <= 400) {
    return FontWeight.w400;
  } else if (weight <= 500) {
    return FontWeight.w500;
  } else if (weight <= 600) {
    return FontWeight.w600;
  } else if (weight <= 700) {
    return FontWeight.w700;
  } else if (weight <= 800) {
    return FontWeight.w800;
  } else {
    return FontWeight.w900;
  }
}
