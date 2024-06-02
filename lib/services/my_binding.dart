import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/utils/button_builder.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';
import 'package:gold_cherry_app_generator/utils/widget_utils.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // Using Get.put for scoped dependencies
    Get.put<PositionCalculator>(PositionCalculator());
    Get.put<DecorationBuilder>(DecorationBuilder());
    Get.put<WidgetUtils>(WidgetUtils());

    // Using Get.put for ButtonBuilder and WidgetBuilderr
    Get.put<ButtonBuilder>(ButtonBuilder(
      positionCalculator: Get.find<PositionCalculator>(),
      decorationBuilder: Get.find<DecorationBuilder>(),
      widgetUtils: Get.find<WidgetUtils>(),
      textBuilder: Get.find<TextBuilder>(),
    ));
    Get.put<WidgetBuilderr>(WidgetBuilderr(
      positionCalculator: Get.find<PositionCalculator>(),
      widgetUtils: Get.find<WidgetUtils>(),
    ));
  }
}
