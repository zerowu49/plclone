import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_appbar.dart';
import 'package:plclone/widget/custom_info.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('EEEE, dd MMM yyyy kk:mm', 'id_ID').format(now);
    var appBar;
    switch (_controller.platform.value) {
      case platformEnum.tokped:
        appBar = CustomAppBar(
          title: "Tokopedia",
          actions: [
            IconButton(
              tooltip: 'Tokopedia Menu',
              splashRadius: 30,
              onPressed: () {},
              icon: Icon(
                Icons.view_comfy,
                color: Colors.black,
              ),
            ),
          ],
        );
        break;
      case platformEnum.gojek:
        appBar = gojekAppBar;
        break;
      case platformEnum.shopee:
        appBar = "Shopee";
        break;
      default:
        appBar = CustomAppBar(
          title: "Tokopedia",
          actions: [
            IconButton(
              tooltip: 'PeduliLindungi',
              splashRadius: 30,
              onPressed: () {},
              icon: Icon(
                Icons.view_comfy,
                color: Colors.black,
              ),
            ),
          ],
        );
        break;
    }

    var list = List<String>.generate(3, (i) => "images/barcode/${i + 1}.jpeg");
    final _random = new Random();
    var imagePath = list[_random.nextInt(list.length)];
    print("imagePath: $imagePath");
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/centang.jpeg',
                  ),
                  radius: 40,
                ),
                SizedBox(height: 2.h),
                NormalText(
                  text: "Check-In Berhasil",
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorPalettes.tokped,
                ),
                SizedBox(height: 2.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorPalettes.scanbackground,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset(
                                imagePath,
                                // scale: 2.5,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: NormalText(
                                text: "Lihat QR Code",
                                color: ColorPalettes.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: ColorPalettes.scanqr,
                                elevation: 0,
                                shape: StadiumBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: "Informasi Check-in",
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        // Pertama
                        CustomInfo(
                          icon: FlutterIcons.home_city_mco,
                          text1: "Lokasi Check-In",
                          text2: _controller.place.value,
                        ),
                        SizedBox(height: 2.h),
                        // Kedua
                        CustomInfo(
                          icon: FlutterIcons.calendar_range_mco,
                          text1: "Tanggal & Waktu Scan",
                          // text2: "Kamis, 23 Dec 2021 16:04",
                          text2: formattedDate,
                        ),
                        SizedBox(height: 2.h),
                        // Ketiga
                        CustomInfo(
                          icon: FlutterIcons.ticket_mco,
                          text1: "Kategori Aktivitas",
                          text2: _controller.kategori.value == ""
                              ? "Aktivitas Dalam Ruangan"
                              : _controller.kategori.value,
                          color2: ColorPalettes.color2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Powered by"),
                        SizedBox(height: 2.h),
                        Image.asset(
                          'images/powered_by.jpeg',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
