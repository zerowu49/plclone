import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';

class CustomCheckbox extends StatelessWidget {
  final Color? color;
  CustomCheckbox({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();

    if (_controller.enableValidator.value) {
      _controller.checkbox.value = false;
    }
    return Obx(
      () => Checkbox(
        activeColor: color,
        value: _controller.checkbox.value,
        onChanged: (newValue) {
          _controller.checkbox.value = newValue!;
        },
      ),
    );
  }
}
