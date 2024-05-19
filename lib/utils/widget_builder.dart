import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/utils/text_builder.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/utils/decoration_builder.dart';
import 'package:gold_cherry_app_generator/utils/size_calculator.dart';
import 'package:gold_cherry_app_generator/utils/alignment_caculator.dart';

class WidgetBuilderr {
  static List<Widget> createFlutterWidgets(
      List<WidgetInfo> widgetInfos, BuildContext context) {
    List<Widget> widgets = [];
    for (var widgetInfo in widgetInfos) {
      Widget widget = createWidget(widgetInfo, context);
      widgets.add(widget);
    }
    return widgets;
  }

  static Widget createWidget(WidgetInfo widgetInfo, BuildContext context) {
    return Positioned(
      left: PositionCalculator.calculateLeft(widgetInfo, context),
      top: PositionCalculator.calculateTop(widgetInfo, context),
      child: _buildContainer(widgetInfo, context),
    );
  }

  static Widget _buildContainer(WidgetInfo widgetInfo, BuildContext context) {
    return Container(
      width: SizeCalculator.calculateWidth(widgetInfo, context),
      height: SizeCalculator.calculateHeight(widgetInfo, context),
      alignment: AlignmentCalculator.calculate(widgetInfo),
      decoration: DecorationBuilder.build(widgetInfo),
      child: Stack(
        children: <Widget>[
          if (widgetInfo.textInfo != null)
            Container(
              alignment: AlignmentCalculator.calculate(widgetInfo),
              child: TextBuilder.buildTextWidget(widgetInfo.textInfo),
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
