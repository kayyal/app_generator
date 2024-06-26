import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/button/button_info.dart';
import 'package:gold_cherry_app_generator/utils/button_builder.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/utils/widget_utils.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/size_calculator.dart';
import 'package:gold_cherry_app_generator/utils/alignment_calculator.dart';
import 'package:gold_cherry_app_generator/widget_type.dart';

class WidgetBuilderr extends GetxController {
  final AlignmentCalculator alignmentCalculator = Get.find();
  final DecorationBuilder decorationBuilder = Get.find();
  final PositionCalculator positionCalculator;
  final SizeCalculator sizeCalculator = Get.find();
  final TextBuilder textBuilder = Get.find();
  ButtonBuilder buttonBuilder = Get.find();
  final WidgetUtils widgetUtils;

  WidgetBuilderr({required this.positionCalculator, required this.widgetUtils});

  List<Widget> createFlutterWidgets(
      List<WidgetInfo> widgetInfos, BuildContext context) {
    return widgetInfos
        .map((widgetInfo) => createWidget(widgetInfo, context))
        .toList();
  }

  Widget createWidget(WidgetInfo widgetInfo, BuildContext context) {
    Widget childWidget;
    switch (widgetInfo.widgetType) {
      case WidgetType.container:
        childWidget = _buildContainer(widgetInfo, context);
        break;
      case WidgetType.text:
        childWidget = _buildText(widgetInfo, context);
        break;
      case WidgetType.button:
        childWidget = buttonBuilder.buildButton(widgetInfo, context);
        break;
      default:
        childWidget = const SizedBox.shrink();
    }

    return _positionedWidget(widgetInfo, context, childWidget);
  }

  Widget _positionedWidget(
      WidgetInfo widgetInfo, BuildContext context, Widget child) {
    return Positioned(
      left: positionCalculator.calculateLeft(widgetInfo, context),
      top: positionCalculator.calculateTop(widgetInfo, context),
      child: child,
    );
  }

  Container _buildContainer(WidgetInfo widgetInfo, BuildContext context) {
    return Container(
      padding: widgetUtils.getButtonPadding(widgetInfo),
      width: sizeCalculator.calculateWidth(widgetInfo, context),
      height: sizeCalculator.calculateHeight(widgetInfo, context),
      alignment: alignmentCalculator.calculate(widgetInfo),
      decoration: decorationBuilder.build(widgetInfo),
      child: _buildContainerChildren(widgetInfo, context),
    );
  }

  Widget _buildContainerChildren(WidgetInfo widgetInfo, BuildContext context) {
    List<Widget> children = [];
    if (widgetInfo.children != null) {
      children.add(Stack(
        children: createFlutterWidgets(widgetInfo.children!, context),
      ));
    }
    return Stack(children: children);
  }

// this methos is incomplete
  Widget _buildText(WidgetInfo widgetInfo, BuildContext context) {
    return Container(
      alignment: alignmentCalculator.calculate(widgetInfo),
      child: textBuilder.buildTextWidget(widgetInfo.textInfo!),
    );
  }
}
