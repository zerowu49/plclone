import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/widget/custom_field_form.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
    TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
              ListTile(
                title: Text(
                  "Field Validator",
                  style: titleStyle,
                ),
                subtitle: Text("Enable to check every fields"),
                leading: Icon(Icons.pageview),
                trailing: Switch.adaptive(
                  value: _controller.enableValidator.value,
                  onChanged: (value) {
                    _controller.enableValidator.value = value;
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Checkbox",
                  style: titleStyle,
                ),
                subtitle: Text("Enable to make it checked directly"),
                leading: Icon(Icons.check_box),
                trailing: Switch.adaptive(
                  value: _controller.checkbox.value,
                  onChanged: (value) {
                    _controller.checkbox.value = value;
                  },
                ),
              ),
              CustomDivider(color: color),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Peduli Lindungi",
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Affect Platform",
                          middleText:
                              "All settings only affect on Peduli Lindungi Platform",
                          textConfirm: "OK",
                          onConfirm: () => Get.back(),
                        );
                      },
                      icon: Icon(Icons.help),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Default Name",
                  style: titleStyle,
                ),
                subtitle: Text(
                  "Automatically use this default name if you don't give a name",
                ),
                leading: Icon(Icons.perm_identity),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Get.defaultDialog(
                    title: "Default Name",
                    content: CustomFieldForm(
                      initialValue: _controller.defaultName.value,
                      keyboardType: TextInputType.text,
                      labelText: 'Default Name',
                      color: color,
                      validator: (value) {
                        if (value!.length == 0) {
                          return "Oops, yang ini wajib diisi";
                        }
                        return "";
                      },
                      onChanged: (val) => _controller.defaultName.value = val,
                    ),
                    textConfirm: "OK",
                    onConfirm: () => Get.back(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.color,
  }) : super(key: key);

  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Divider(
        thickness: 1,
        color: color,
      ),
    );
  }
}
