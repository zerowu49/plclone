import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plclone/page/gojek_init_page.dart';
import 'package:plclone/page/shopee_init_page.dart';
import 'package:plclone/page/tokped_init_page.dart';
import 'package:plclone/widget/icon_card.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peduli Lindungi Clone"),
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
                print("Tokped Page");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TokpedInitPage()));
                // Get.to(TokpedInitPage());
              },
            ),
            IconCard(
              platformName: "Gojek",
              imagePath: "images/platform/gojek.jpeg",
              onPressed: () {
                print("Gojek Page");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GojekInitPage()));
              },
            ),
            IconCard(
              platformName: "Shopee",
              imagePath: "images/platform/shopee.png",
              onPressed: () {
                print("Shopee Page");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ShopeeInitPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
