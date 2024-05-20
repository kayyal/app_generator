import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/size_calculator.dart';
import 'package:gold_cherry_app_generator/utils/alignment_calculator.dart';

class WidgetBuilderr extends GetxController {
  final AlignmentCalculator alignmentCalculator = Get.find();
  final DecorationBuilder decorationBuilder = Get.find();
  final PositionCalculator positionCalculator = Get.find();
  final SizeCalculator sizeCalculator = Get.find();
  final TextBuilder textBuilder = Get.find();

  List<Widget> createFlutterWidgets(
      List<WidgetInfo> widgetInfos, BuildContext context) {
    List<Widget> widgets = [];
    for (var widgetInfo in widgetInfos) {
      Widget widget = createWidget(widgetInfo, context);
      widgets.add(widget);
    }
    return widgets;
  }

  Widget createWidget(WidgetInfo widgetInfo, BuildContext context) {
    return Positioned(
      left: positionCalculator.calculateLeft(widgetInfo, context),
      top: positionCalculator.calculateTop(widgetInfo, context),
      child: _buildContainer(widgetInfo, context),
    );
  }

  Container _buildContainer(WidgetInfo widgetInfo, BuildContext context) {
    return Container(
      width: sizeCalculator.calculateWidth(widgetInfo, context),
      height: sizeCalculator.calculateHeight(widgetInfo, context),
      alignment: alignmentCalculator.calculate(widgetInfo),
      decoration: decorationBuilder.build(widgetInfo),
      child: Stack(
        children: <Widget>[
          if (widgetInfo.textInfo != null)
            Container(
              alignment: alignmentCalculator.calculate(widgetInfo),
              child: textBuilder.buildTextWidget(widgetInfo.textInfo),
            ),
          if (widgetInfo.children != null)
            Stack(
              children: <Widget>[
                ...createFlutterWidgets(widgetInfo.children!, context),
              ],
            ),
        ],
      ),
    );
  }
}
