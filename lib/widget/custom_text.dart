import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

var styles = {
  'b': StyledTextTag(
    style: TextStyle(fontWeight: FontWeight.w700),
  ),
  'boldGreen': StyledTextTag(
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
  ),
  'boldBlue': StyledTextTag(
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
  'green': StyledTextTag(
    style: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.green,
    ),
  ),
};

class NormalText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderline;
  final String? fontFamily;

  NormalText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.textAlign,
    this.isUnderline = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? fontFamily;

  CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return StyledText(
      text: text,
      maxLines: maxLines,
      textAlign: textAlign != null ? textAlign! : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
      tags: styles,
    );
  }
}
