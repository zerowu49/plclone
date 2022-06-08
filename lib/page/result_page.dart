import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_appbar.dart';
import 'package:plclone/widget/custom_back_button.dart';
import 'package:plclone/widget/custom_info.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
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
      case platformEnum.pl:
        appBar = AppBar(
          automaticallyImplyLeading: false,
          leading: CustomBackButton(withArrow: false),
          elevation: 0,
          backgroundColor: Colors.white,
        );
        break;
      default:
        appBar = CustomAppBar(
          title: "Default",
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
                BottomPlatformWidget(
                  imagePath: imagePath,
                  controller: _controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomPlatformWidget extends StatelessWidget {
  const BottomPlatformWidget({
    Key? key,
    required this.imagePath,
    required DataController controller,
  })  : _controller = controller,
        super(key: key);

  final String imagePath;
  final DataController _controller;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('EEEE, dd MMM yyyy kk:mm', 'id_ID').format(now);
    if (_controller.platform.value == platformEnum.pl) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            FilterChip(
              label: Text("Check-in Sendiri"),
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide()),
              onSelected: (bool value) {
                print("selected");
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(FlutterIcons.calendar_range_mco),
                    Text("08 Jun 2022"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.lock_clock),
                    Text("13:11"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "The color status below is based on check-in histories at other places",
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: NormalText(
                text: _controller.name.value,
                color: ColorPalettes.white,
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorPalettes.tokped,
                elevation: 0,
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
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
    );
  }
}
