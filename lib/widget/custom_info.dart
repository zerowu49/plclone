import 'package:flutter/material.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class CustomInfo extends StatelessWidget {
  final IconData icon;
  final text1, text2;
  final color2;

  CustomInfo({
    required this.icon,
    required this.text1,
    required this.text2,
    this.color2 = ColorPalettes.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              text: text1,
              fontSize: 13.0.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            SizedBox(height: 8),
            NormalText(
              text: text2,
              color: color2,
            ),
          ],
        ),
      ],
    );
  }
}
