import 'package:flutter/material.dart';
import 'package:gold_cherry_app_generator/text/text_info.dart';
import 'package:get/get.dart';

class TextBuilder extends GetxController {
  Text buildTextWidget(TextInfo? textInfo) {
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
          fontSize: textInfo?.style.size ?? 14,
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

  FontWeight calculateFontWeight(double weight) {
    if (weight <= 100) {
      return FontWeight.w100;
    } else if (weight <= 200) {
      return FontWeight.w200;
    } else if (weight <= 300) {
      return FontWeight.w300;
    } else if (weight <= 400) {
      return FontWeight.w400;
    } else if (weight <= 500) {
      return FontWeight.w500;
    } else if (weight <= 600) {
      return FontWeight.w600;
    } else if (weight <= 700) {
      return FontWeight.w700;
    } else if (weight <= 800) {
      return FontWeight.w800;
    } else {
      return FontWeight.w900;
    }
  }
}
