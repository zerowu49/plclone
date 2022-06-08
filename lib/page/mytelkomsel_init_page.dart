import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plclone/controller/data_controller.dart';
import 'package:plclone/page/form_pl_page.dart';
import 'package:plclone/utils/styles.dart';
import 'package:plclone/widget/custom_checkbox.dart';
import 'package:plclone/widget/custom_field_form.dart';
import 'package:plclone/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class MytelkomselInitPage extends StatelessWidget {
  const MytelkomselInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.find<DataController>();
    final _formKey = GlobalKey<FormState>();
    final color = ColorPalettes.mytelkomsel;
    final fontFamily = "Poppins";
    int nikLength = 0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
              tooltip: 'Back',
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              width: 1,
              height: 30,
              child: Text(""),
            ),
            SizedBox(width: 8),
            Image.asset(
              "images/platform/my_telkomsel.png",
              width: 30,
            ),
            SizedBox(width: 8),
            Text(
              "PeduliLindungi",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 3.h),
                Image.asset(
                  'images/pl_logo.png',
                  width: 25.w,
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: _controller.name.value,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap sesuai KTP',
                            labelStyle: TextStyle(
                              color: ColorPalettes.whiteDark,
                              fontFamily: fontFamily,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (_controller.enableValidator.value) {
                              if (value!.length == 0) {
                                return "Oops, yang ini wajib diisi";
                              }
                            }
                          },
                          onChanged: (val) => _controller.name.value = val,
                        ),
                        SizedBox(height: 1.h),
                        NormalText(
                          text: "Nama Lengkap harus sesuai KTP",
                          fontSize: 9.sp,
                          fontFamily: fontFamily,
                        ),
                        SizedBox(height: 3.h),
                        TextFormField(
                          initialValue: _controller.nik.value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'NIK',
                            labelStyle: TextStyle(
                              color: ColorPalettes.whiteDark,
                              fontFamily: fontFamily,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: color),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          validator: (value) {
                            if (_controller.enableValidator.value) {
                              if (value!.length == 0) {
                                return "Oops, yang ini wajib diisi";
                              } else if (value.length <= 16) {
                                return "Oops, harus 16 angka. Cek lagi, ya.";
                              }
                            }
                          },
                          onChanged: (val) {
                            nikLength = val.length;
                            _controller.nik.value = val;
                          },
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalText(
                              text: "Pastikan NIK 16 digit",
                              fontSize: 9.sp,
                              fontFamily: fontFamily,
                            ),
                            NormalText(
                              text: "${nikLength.toString()}/16",
                              fontSize: 9.sp,
                              fontFamily: fontFamily,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: CustomCheckbox(color: color)),
                      Expanded(
                        flex: 8,
                        child: CustomText(
                          text:
                              "Data di atas adalah milik saya sendiri. Saya juga menyetujui <boldBlue>Syarat dan Ketentuan</boldBlue> serta <boldBlue>Kebijakan Privasi</boldBlue> PeduliLindungi.",
                          fontSize: 9.sp,
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
                          child: Text(
                            "Lanjut Scan QR",
                            style: TextStyle(
                                fontSize: 12.sp, fontFamily: fontFamily),
                          ),
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
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: Colors.white,
                            elevation: 0.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      NormalText(
                        text:
                            "Segala proses verifikasi termasuk penyimpanan data dan informasi akan dilakukan sepenuhnya oleh dan menjadi tanggung jawab PeduliLindungi.",
                        fontSize: 9.sp,
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
