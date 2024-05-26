import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_cherry_app_generator/button/button_info.dart';
import 'package:gold_cherry_app_generator/widget/widget_info.dart';

class ButtonBuilder extends GetxController {
  Widget buildButton(WidgetInfo widgetInfo, BuildContext context) {
    if (widgetInfo.buttonInfo == null) {
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      style: _buildButtonStyle(widgetInfo),
      onPressed: _getOnPressedCallback(widgetInfo.buttonInfo!),
      child: _buildButtonText(widgetInfo),
    );
  }

  ButtonStyle _buildButtonStyle(WidgetInfo widgetInfo) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getButtonColor(widgetInfo),
      padding: _getButtonPadding(widgetInfo),
      shape: RoundedRectangleBorder(borderRadius: _getBorderRadius(widgetInfo)),
      shadowColor: _getBoxShadowColor(widgetInfo),
      elevation: _getBoxShadowElevation(widgetInfo),
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

  Color? _getBoxShadowColor(WidgetInfo widgetInfo) {
    if (widgetInfo.widgetStyle.shadows.isEmpty) return null;
    return Color.fromRGBO(
      widgetInfo.widgetStyle.shadows[0].color.r,
      widgetInfo.widgetStyle.shadows[0].color.g,
      widgetInfo.widgetStyle.shadows[0].color.b,
      widgetInfo.widgetStyle.shadows[0].color.opacity,
    );
  }

  double _getBoxShadowElevation(WidgetInfo widgetInfo) {
    if (widgetInfo.widgetStyle.shadows.isEmpty) return 0;
    return widgetInfo.widgetStyle.shadows[0].blurRadius;
  }

  Text _buildButtonText(WidgetInfo widgetInfo) {
    return Text(
      widgetInfo.buttonInfo!.buttonText,
      style: TextStyle(
        color: Color.fromRGBO(
          widgetInfo.widgetStyle.color.r,
          widgetInfo.widgetStyle.color.g,
          widgetInfo.widgetStyle.color.b,
          widgetInfo.widgetStyle.color.opacity,
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
}

void handleClick() {
  print("Button clicked!");
}
