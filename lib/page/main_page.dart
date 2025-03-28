import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/additional_form.dart';
import 'package:plclone/page/settings_page.dart';
import 'package:plclone/widget/icon_card.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Init get
    final _controller = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Peduli Lindungi Clone"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => SettingsPage(),
                transition: Transition.rightToLeft,
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 5.w,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 2.h,
          children: [
            IconCard(
              platformName: "Tokopedia",
              imagePath: "images/platform/tokped.jpeg",
              onPressed: () {
                _controller.platform.value = platformEnum.tokped;
                Get.dialog(AdditionalForm());
              },
            ),
            IconCard(
              platformName: "Gojek",
              imagePath: "images/platform/gojek.jpeg",
              onPressed: () {
                _controller.platform.value = platformEnum.gojek;
                Get.dialog(AdditionalForm());
              },
            ),
            IconCard(
              platformName: "My Telkomsel",
              imagePath: "images/platform/my_telkomsel.png",
              onPressed: () {
                _controller.platform.value = platformEnum.mytelkomsel;
                Get.dialog(AdditionalForm());
              },
            ),
            IconCard(
              platformName: "Shopee",
              imagePath: "images/platform/shopee.png",
              onPressed: () {
                // _controller.platform.value = platformEnum.shopee;
                // Get.dialog(AdditionalForm());
                Get.snackbar("Coming Soon!", "Waiting for UI");
              },
            ),
            IconCard(
              platformName: "Peduli Lindungi",
              imagePath: "images/pl_logo.png",
              onPressed: () {
                _controller.platform.value = platformEnum.pl;
                Get.dialog(AdditionalForm());
              },
            ),
          ],
        ),
      ),
    );
  }
}
