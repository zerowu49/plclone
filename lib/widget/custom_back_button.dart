import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBackButton extends StatelessWidget {
  final bool? withArrow;
  final dynamic result;
  final void Function()? customOnPressed;
  CustomBackButton({
    Key? key,
    this.withArrow,
    this.result,
    this.customOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: Icon(
        withArrow == true ? Icons.close : Icons.arrow_back_sharp,
        color: Colors.black,
        size: 22.0.sp,
      ),
      onPressed: customOnPressed != null
          ? customOnPressed
          : () => Navigator.pop(context, result),
      tooltip: 'Back',
    );
  }
}
