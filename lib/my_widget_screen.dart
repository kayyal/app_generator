import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/json_string.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class MyWidgetScreen extends StatelessWidget {
  final String jsonString = JsonString.nestedJson;

  @override
  Widget build(BuildContext context) {
    List<WidgetInfo> widgetModels = parseWidgets(jsonString);
    List<Widget> flutterWidgets = createFlutterWidgets(widgetModels, context);

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
    final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<WidgetInfo>((json) => WidgetInfo.fromJson(json)).toList();
  }

  List<Widget> createFlutterWidgets(
      List<WidgetInfo> widgets, BuildContext context) {
    return widgets.map((widgetInfo) {
      double left;
      double top;
      double width;
      double height;
      Color color;

      // Calculate position and size based on widgetLayout and isAbsolutePosition/isAbsoluteSize
      if (widgetInfo.widgetLayout.isAbsolutePosition) {
        left = widgetInfo.widgetLayout.dx;
        top = widgetInfo.widgetLayout.dy;
      } else {
        left = widgetInfo.widgetLayout.dx * MediaQuery.of(context).size.width;
        top = widgetInfo.widgetLayout.dy * MediaQuery.of(context).size.height;
      }

      if (widgetInfo.widgetLayout.isAbsoluteSize) {
        width = widgetInfo.widgetLayout.width;
        height = widgetInfo.widgetLayout.height;
      } else {
        width =
            widgetInfo.widgetLayout.width * MediaQuery.of(context).size.width;
        height =
            widgetInfo.widgetLayout.height * MediaQuery.of(context).size.height;
      }

      color = Color.fromRGBO(
        widgetInfo.widgetStyle.color.r,
        widgetInfo.widgetStyle.color.g,
        widgetInfo.widgetStyle.color.b,
        widgetInfo.widgetStyle.color.opacity,
      );

      return Positioned(
        left: left,
        top: top,
        child: Container(
          width: width,
          height: height,
          color: color,
          child: widgetInfo.children != null
              ? Stack(
                  children: createFlutterWidgets(widgetInfo.children!, context),
                )
              : null,
        ),
      );
    }).toList();
  }
}
