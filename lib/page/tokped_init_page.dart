import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/form_pl_page.dart';
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
    final fontFamily = "Nunito";

    return Scaffold(
      appBar: tokpedAppBar(),
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
                          initialValue: _controller.name.value,
                          keyboardType: TextInputType.text,
                          labelText: 'Nama Lengkap sesuai KTP',
                          color: color,
                          fontFamily: fontFamily,
                          validator: (value) {
                            if (_controller.enableValidator.value) {
                              if (value!.length == 0) {
                                return "Oops, yang ini wajib diisi";
                              }
                            }
                          },
                          onChanged: (val) => _controller.name.value = val,
                        ),
                        SizedBox(height: 3.h),
                        CustomFieldForm(
                          initialValue: _controller.nik.value,
                          keyboardType: TextInputType.number,
                          labelText: 'NIK',
                          color: color,
                          fontFamily: fontFamily,
                          validator: (value) {
                            if (_controller.enableValidator.value) {
                              if (value!.length == 0) {
                                return "Oops, yang ini wajib diisi";
                              } else if (value.length <= 16) {
                                return "Oops, harus 16 angka. Cek lagi, ya.";
                              }
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          onChanged: (val) => _controller.nik.value = val,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: CustomCheckbox(color: color)),
                      Expanded(
                        flex: 8,
                        child: CustomText(
                          text:
                              "Data di atas adalah milik saya sendiri. Saya juga menyetujui <boldGreen>Syarat dan Ketentuan</boldGreen> serta <boldGreen>Kebijakan Privasi</boldGreen> PeduliLindungi.",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          child: Text("Lanjut Scan QR"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_controller.checkbox.value)
                                Get.to(
                                  () => FormPlPage(),
                                  transition: Transition.noTransition,
                                );
                              else
                                Get.snackbar("Cek form", "Isi semua data!");
                            }
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
                      NormalText(
                        text:
                            "Segala proses verifikasi termasuk penyimpanan data dan informasi akan dilakukan sepenuhnya oleh dan menjadi tanggung jawab PeduliLindungi.",
                        fontSize: 11.sp,
                        fontFamily: fontFamily,
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
