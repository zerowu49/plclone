import 'package:flutter/material.dart';
import 'package:plclone/utils/styles.dart';

class CustomFieldForm extends StatelessWidget {
  final String initialValue;
  final TextInputType keyboardType;
  final String labelText;
  final Color color;
  final Function(String) onChanged;
  final String? fontFamily;
  CustomFieldForm({
    Key? key,
    required this.initialValue,
    required this.keyboardType,
    required this.labelText,
    required this.color,
    required this.onChanged,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: ColorPalettes.whiteDark,
          fontFamily: fontFamily,
        ),
        contentPadding: EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
