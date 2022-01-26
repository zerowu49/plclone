import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/result_page.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_field_form.dart';
import 'package:sizer/sizer.dart';

class AdditionalForm extends StatelessWidget {
  const AdditionalForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
    final color = ColorPalettes.tokped;

    return Dialog(
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 3.h),
            CustomFieldForm(
              initialValue: _controller.place.value,
              keyboardType: TextInputType.text,
              labelText: 'Lokasi Checkin (required)',
              color: color,
              onChanged: (val) => _controller.place.value = val,
            ),
            SizedBox(height: 3.h),
            CustomFieldForm(
              initialValue: _controller.kategori.value,
              keyboardType: TextInputType.text,
              labelText: 'Kategori Aktivitas (optional)',
              color: color,
              onChanged: (val) => _controller.kategori.value = val,
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
              child: Text("Lanjut"),
              onPressed: () {
                if (_controller.place.value == "") {
                  Get.snackbar("Cek form", "Masukkan lokasi checkin");
                } else {
                  Get.back();
                  Get.to(() => ResultPage());
                }
              },
              style: TextButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 1.5.h),
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                primary: Colors.white,
                elevation: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
