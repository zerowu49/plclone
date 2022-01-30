import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/form_pl_page.dart';
import 'package:plclone/page/result_page.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_appbar.dart';
import 'package:plclone/widget/custom_checkbox.dart';
import 'package:plclone/widget/custom_field_form.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class TokpedInitPage extends StatelessWidget {
  const TokpedInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
    final _formKey = GlobalKey<FormState>();
    final color = ColorPalettes.tokped;

    _controller.checkbox.value = false;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Check-in PeduliLindungi",
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/pl_logo.png',
                  ),
                  radius: 40,
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFieldForm(
                          initialValue: _controller.nik.value,
                          keyboardType: TextInputType.text,
                          labelText: 'Nama Lengkap sesuai KTP',
                          color: color,
                          onChanged: (val) => _controller.name.value = val,
                        ),
                        SizedBox(height: 3.h),
                        CustomFieldForm(
                          initialValue: _controller.nik.value,
                          keyboardType: TextInputType.number,
                          labelText: 'NIK',
                          color: color,
                          onChanged: (val) => _controller.nik.value = val,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(child: CustomCheckbox()),
                      Expanded(
                        flex: 8,
                        child: CustomText(
                          text:
                              "Data di atas adalah milik saya sendiri. Saya juga menyetujui <boldGreen>Syarat dan Ketentuan</boldGreen> serta <boldGreen>Kebijakan Privasi</boldGreen> PeduliLindungi.",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          child: Text("Lanjut Scan QR"),
                          onPressed: () {
                            if (_controller.name.value != "" &&
                                _controller.nik.value != '' &&
                                _controller.checkbox.value)
                              Get.to(() => ResultPage());
                            else
                              Get.snackbar("Cek form", "Isi semua data!");
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
                      SizedBox(height: 2.h),
                      Text(
                        "Segala proses verifikasi termasuk penyimpanan data dan informasi akan dilakukan sepenuhnya oleh dan menjadi tanggung jawab PeduliLindungi.",
                      ),
                    ],
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
