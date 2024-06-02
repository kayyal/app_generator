import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/utils/button_builder.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // Using Get.put for scoped dependencies
    Get.put<PositionCalculator>(PositionCalculator());
    Get.put<DecorationBuilder>(DecorationBuilder());

    // Using Get.put for ButtonBuilder and WidgetBuilderr
    Get.put<ButtonBuilder>(ButtonBuilder(
        positionCalculator: Get.find<PositionCalculator>(),
        decorationBuilder: Get.find<DecorationBuilder>()));
    Get.put<WidgetBuilderr>(
        WidgetBuilderr(positionCalculator: Get.find<PositionCalculator>()));
  }
}
