import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:plclone/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum platformEnum { tokped, gojek, mytelkomsel, shopee, pl }

class DataController extends GetxController {
  RxString name = "".obs;
  RxString nik = "".obs;
  RxString place = "".obs;
  RxString kategori = "".obs;
  Rx<platformEnum> platform = platformEnum.gojek.obs;

  // Configurable
  RxBool checkbox = true.obs;
  RxBool enableValidator = false.obs;
  RxString defaultName = "".obs;
  // Variable is in String but input is in number
  RxString totalVisitor = "89".obs;
  RxString maxVisitor = "1000".obs;

  @override
  void onInit() async {
    try {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();

      // Set default name
      String nameDb = prefs.getString(Const.defaultName) ?? "Kevin";
      defaultName.value = nameDb;

      // Set totalVisitor
      String totalVisitorDb = prefs.getString(Const.totalVisitor) ?? "89";
      totalVisitor.value = totalVisitorDb.toString();
      log("totalVisitor: $totalVisitor");

      // Set maxVisitor
      String maxVisitorDb = prefs.getString(Const.maxVisitor) ?? "1000";
      maxVisitor.value = maxVisitorDb.toString();
      log("maxVisitor: $maxVisitor");
      // Set
    } catch (e) {
      print("error in get default name : $e");
    }

    super.onInit();
  }

  void saveDefaultName() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    // Set name in local db
    await prefs.setString(Const.defaultName, defaultName.value);
  }

  void saveVisitorAmount() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // Set newTotalVisitor in local db
    await prefs.setString(Const.totalVisitor, totalVisitor.value);

    // Set newMaxVisitor in local db
    await prefs.setString(Const.maxVisitor, maxVisitor.value);
  }
}
