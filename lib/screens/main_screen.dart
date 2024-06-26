import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/services/json_string.dart';
import 'package:gold_cherry_app_generator/services/my_binding.dart';
import 'package:gold_cherry_app_generator/services/widget_parser.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';

class MainScreen extends StatelessWidget {
  final WidgetParser widgetParser = Get.find();
  final WidgetBuilderr widgetBuilder = Get.find();

  final String jsonString = JsonString.nestedJson6;

  @override
  Widget build(BuildContext context) {
    List<WidgetInfo> widgetInfos = widgetParser.parseWidgets(jsonString);
    List<Widget> flutterWidgets =
        widgetBuilder.createFlutterWidgets(widgetInfos, context);

    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: flutterWidgets,
        ),
      ),
    );
  }
}
