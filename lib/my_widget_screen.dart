import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/json_string.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/text/text_style_info.dart';

class MyWidgetScreen extends StatelessWidget {
  final String jsonString = JsonString.nestedJson6;

  @override
  Widget build(BuildContext context) {
    List<WidgetInfo> widgetInfos = parseWidgets(jsonString);
    List<Widget> flutterWidgets = createFlutterWidgets(widgetInfos, context);

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

Widget createWidget(WidgetInfo widgetInfo, BuildContext context) {
  var alignedWithParent = widgetInfo.alignedWithParent;
  return Positioned(
    left: widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dx
        : widgetInfo.widgetLayout.dx * MediaQuery.of(context).size.width,
    top: widgetInfo.widgetLayout.isAbsolutePosition
        ? widgetInfo.widgetLayout.dy
        : widgetInfo.widgetLayout.dy * MediaQuery.of(context).size.height,
    // width: widthV,
    // height: widthV,
    child: Container(
      width: widgetInfo.widgetLayout.isAbsoluteSize
          ? widgetInfo.widgetLayout.width
          : widgetInfo.widgetLayout.width * MediaQuery.of(context).size.width,
      height: widgetInfo.widgetLayout.isAbsoluteSize
          ? widgetInfo.widgetLayout.height
          : widgetInfo.widgetLayout.height * MediaQuery.of(context).size.height,
      alignment: alignedWithParent?.toAlignment() ?? Alignment.center,
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
      child: Stack(
        children: <Widget>[
          if (widgetInfo.textInfo != null)
            Container(
              alignment: alignedWithParent?.toAlignment() ?? Alignment.center,
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
            ),
          if (widgetInfo.children != null)
            Stack(
              children: <Widget>[
                ...createFlutterWidgets(widgetInfo.children!, context),
              ],
            ),
        ],
      ),
    ),
  );
}

List<Widget> createFlutterWidgets(
    List<WidgetInfo> widgetInfos, BuildContext context) {
  List<Widget> widgets = [];
  for (var widgetInfo in widgetInfos) {
    Widget widget = createWidget(widgetInfo, context);
    widgets.add(widget);
  }
  return widgets;
}
