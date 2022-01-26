import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

final styles = {
  'b': StyledTextTag(
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  'boldGreen': StyledTextTag(
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
  ),
};

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderline;

  NormalText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.maxLines,
    this.textAlign,
    this.isUnderline = false,
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

  CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.textAlign,
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
      ),
      tags: styles,
    );
  }
}
