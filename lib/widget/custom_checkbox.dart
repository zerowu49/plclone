import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';

class CustomCheckbox extends StatefulWidget {
  final Color? color;
  CustomCheckbox({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  DataController _controller = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    if (_controller.enableValidator.value) {
      _controller.checkbox.value = false;
    }
    return Checkbox(
      activeColor: widget.color,
      value: _controller.checkbox.value,
      onChanged: (newValue) {
        setState(() {
          _controller.checkbox.value = newValue!;
        });
      },
    );
  }
}
