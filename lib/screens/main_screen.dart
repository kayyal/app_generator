import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/services/json_string.dart';
import 'package:gold_cherry_app_generator/services/widget_parser.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';

class MainScreen extends StatelessWidget {
  final String jsonString = JsonString.nestedJson6;

  @override
  Widget build(BuildContext context) {
    List<WidgetInfo> widgetInfos = WidgetParser.parseWidgets(jsonString);
    List<Widget> flutterWidgets =
        WidgetBuilderr.createFlutterWidgets(widgetInfos, context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: flutterWidgets,
        ),
      ),
    );
  }
}
