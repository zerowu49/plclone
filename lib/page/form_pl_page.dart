import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/result_page.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_appbar.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class FormPlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<DataController>();
    final platform = _controller.platform.value;
    final color = ColorPalettes.tokped;
    final fontFamily = "Nunito";
    final textData = [
      {
        "image_path": "images/image_1.jpeg",
        "text":
            "Kamu harus <b>check-in dengan scan QR</b> untuk masuk tempat tujuan yang mewajibkan.",
      },
      {
        "image_path": "images/image_2.jpeg",
        "text":
            "Kamu bisa <b>check-in lebih dari sekali</b> jika diwajibkan oleh tenant/merchant di dalam tempat tujuan kamu.",
      },
      {
        "image_path": "images/image_3.jpeg",
        "text":
            "Jangan lupa <b>check-out dengan scan QR</b> lagi saat keluar dari tempat tujuan.",
      },
    ];

    var appBar;
    if (platform == platformEnum.tokped) {
      appBar = tokpedAppBar();
    } else if (platform == platformEnum.gojek) {
      appBar = gojekAppBar();
    }

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'images/header_form.jpeg',
                  width: 100.w,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: "Tentang pemakaian scan QR:",
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      SizedBox(height: 3.h),
                      for (var e in textData)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(e["image_path"]!),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  flex: 13,
                                  child: CustomText(
                                    text: e["text"]!,
                                    color: ColorPalettes.grey,
                                    fontSize: 13.sp,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                    ],
                  ),
                ),
                Container(height: 10, color: ColorPalettes.white),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/vaccine_icon.jpeg",
                            width: 23,
                          ),
                          NormalText(
                            text: "Pastikan hasil tes kamu terdaftar!",
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text:
                            "Biar tercatat di PeduliLindungi, pastikan kamu tes COVID-19 di <green>lokasi yang terdaftar Kemenkes.</green>",
                        color: ColorPalettes.grey,
                        fontSize: 13.sp,
                        fontFamily: fontFamily,
                      ),
                    ],
                  ),
                ),
                Container(height: 10, color: ColorPalettes.white),
                SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomText(
                      text:
                          "Mau check-in pakai NIK lain? <green>Ganti NIK</green>",
                      fontFamily: fontFamily,
                      color: ColorPalettes.grey,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
                      child: Text("Lanjut Scan QR"),
                      onPressed: () {
                        Get.to(() => ResultPage());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0.w, vertical: 1.5.h),
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.white,
                        elevation: 0.0,
                      ),
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
