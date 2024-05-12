import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/text/text_info.dart';
import 'package:gold_cherry_app_generator/text/text_style_info.dart';
import 'package:gold_cherry_app_generator/widget/widget_rgb_color.dart';

class BuildWidget {}

Widget buildTextWidget(TextInfo? textInfo) {
  if (textInfo != null) {
    return Text(
      textInfo.content.text,
      style: TextStyle(
        color: Color.fromRGBO(
          textInfo.style.color.r,
          textInfo.style.color.g,
          textInfo.style.color.b,
          1.0,
        ),
        fontSize: textInfo.style.size,
        fontWeight: calculateFontWeight(textInfo.style.weight),
        decoration: textInfo.style.underline
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  } else {
    return Text('No text information provided');
  }
}

Widget buildContainerWidget(WidgetRgbColor colorInfo) {
  return Container(
    color: Color.fromRGBO(
      colorInfo.r,
      colorInfo.g,
      colorInfo.b,
      colorInfo.opacity,
    ),
  );
}
