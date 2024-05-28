import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/utils/button_builder.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    PositionCalculator positionCalculator = Get.put(PositionCalculator());

    Get.lazyPut(() => ButtonBuilder(positionCalculator: positionCalculator));
    Get.lazyPut(() => WidgetBuilderr(positionCalculator: positionCalculator));
  }
}
