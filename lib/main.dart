import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/services/widget_parser.dart';
import 'package:gold_cherry_app_generator/utils/alignment_calculator.dart';
import 'package:gold_cherry_app_generator/utils/button_builder.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/size_calculator.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/utils/widget_builder.dart';

void main() {
  Get.put(ButtonBuilder(positionCalculator: PositionCalculator()));
  Get.put(WidgetParser());
  Get.put(AlignmentCalculator());
  Get.put(DecorationBuilder());
  // Get.put(PositionCalculator());
  Get.put(SizeCalculator());
  Get.put(TextBuilder());
  Get.put(WidgetBuilderr(positionCalculator: PositionCalculator()));
  runApp(MainScreen());
}
