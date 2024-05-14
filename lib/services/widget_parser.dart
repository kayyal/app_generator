import 'dart:convert';

import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class WidgetParser {
  static List<WidgetInfo> parseWidgets(String jsonString) {
    final parsedMap = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return parsedMap
        .map<WidgetInfo>((json) => WidgetInfo.fromJson(json))
        .toList();
  }
}
