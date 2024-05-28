import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/button/button_info.dart';
import 'package:gold_cherry_app_generator/button/button_rgb_color.dart';
import 'package:gold_cherry_app_generator/utils/position_calculator.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class ButtonBuilder extends GetxController {
  final PositionCalculator positionCalculator;

  ButtonBuilder({required this.positionCalculator});

  Widget buildButton(WidgetInfo widgetInfo, BuildContext context) {
    if (widgetInfo.buttonInfo == null) {
      return const SizedBox.shrink();
    }
    return Positioned(
      left: positionCalculator.calculateLeft(widgetInfo, context),
      top: positionCalculator.calculateTop(widgetInfo, context),
      child: InkWell(
        onTap: _getOnPressedCallback(widgetInfo.buttonInfo!),
        overlayColor: _getOverlayColor(widgetInfo.buttonInfo!),
        child: Container(
          decoration: _buildBoxDecoration(widgetInfo),
          padding: _getButtonPadding(widgetInfo),
          child: Center(child: _buildButtonText(widgetInfo)),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(WidgetInfo widgetInfo) {
    return BoxDecoration(
      color: _getButtonColor(widgetInfo),
      borderRadius: _getBorderRadius(widgetInfo),
      boxShadow: _getBoxShadows(widgetInfo),
    );
  }

  Color _getButtonColor(WidgetInfo widgetInfo) {
    return Color.fromRGBO(
      widgetInfo.widgetStyle.color.r,
      widgetInfo.widgetStyle.color.g,
      widgetInfo.widgetStyle.color.b,
      widgetInfo.widgetStyle.color.opacity,
    );
  }

  EdgeInsets _getButtonPadding(WidgetInfo widgetInfo) {
    return EdgeInsets.fromLTRB(
      widgetInfo.widgetLayout.padding.left,
      widgetInfo.widgetLayout.padding.top,
      widgetInfo.widgetLayout.padding.right,
      widgetInfo.widgetLayout.padding.bottom,
    );
  }

  BorderRadius _getBorderRadius(WidgetInfo widgetInfo) {
    return BorderRadius.only(
      topRight: Radius.circular(widgetInfo.widgetStyle.corner.topRight),
      topLeft: Radius.circular(widgetInfo.widgetStyle.corner.topLeft),
      bottomRight: Radius.circular(widgetInfo.widgetStyle.corner.bottomRight),
      bottomLeft: Radius.circular(widgetInfo.widgetStyle.corner.bottomLeft),
    );
  }

  List<BoxShadow> _getBoxShadows(WidgetInfo widgetInfo) {
    if (widgetInfo.widgetStyle.shadows.isEmpty) return [];
    return [
      BoxShadow(
        color: Color.fromRGBO(
          widgetInfo.widgetStyle.shadows[0].color.r,
          widgetInfo.widgetStyle.shadows[0].color.g,
          widgetInfo.widgetStyle.shadows[0].color.b,
          widgetInfo.widgetStyle.shadows[0].color.opacity,
        ),
        blurRadius: widgetInfo.widgetStyle.shadows[0].blurRadius,
        offset: Offset(
          widgetInfo.widgetStyle.shadows[0].offsetX,
          widgetInfo.widgetStyle.shadows[0].offsetY,
        ),
      )
    ];
  }

  Text _buildButtonText(WidgetInfo widgetInfo) {
    return Text(
      widgetInfo.textInfo!.content.text,
      style: TextStyle(
        color: Color.fromRGBO(
          widgetInfo.textInfo!.style.color.r,
          widgetInfo.textInfo!.style.color.g,
          widgetInfo.textInfo!.style.color.b,
          1,
        ),
        fontSize: widgetInfo.textInfo?.style.size ?? 14,
        fontWeight: FontWeight.values[5],
      ),
    );
  }

  VoidCallback _getOnPressedCallback(ButtonInfo buttonInfo) {
    switch (buttonInfo.action.onPressed) {
      case "handleClick":
        return handleClick;
      default:
        return () {};
    }
  }

  MaterialStateProperty<Color?> _getOverlayColor(ButtonInfo buttonInfo) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return _getOverlayColorValue(
            buttonInfo.colorStyle.pressedColor, Colors.black.withOpacity(0.1));
      } else if (states.contains(MaterialState.hovered)) {
        return _getOverlayColorValue(
            buttonInfo.colorStyle.hoveredColor, Colors.grey.withOpacity(0.1));
      } else if (states.contains(MaterialState.focused)) {
        return _getOverlayColorValue(
            buttonInfo.colorStyle.focusedColor, Colors.blue.withOpacity(0.1));
      }
      return null; // No overlay color for other states.
    });
  }

  Color _getOverlayColorValue(ButtonRgbColor? color, Color defaultColor) {
    if (color == null) {
      return defaultColor;
    }
    return Color.fromRGBO(
      color.r,
      color.g,
      color.b,
      color.opacity,
    );
  }
}

void handleClick() {
  print("Button clicked!");
}
