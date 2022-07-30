import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:plclone/utils/const.dart';

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
  RxString defaultName = "Kevin".obs;
  // Variable is in String but input is in number
  RxString totalVisitor = "89".obs;
  RxString maxVisitor = "1000".obs;

  @override
  void onInit() async {
    print("call onInit");
    try {
      var hiveBox = await Hive.openBox(Const.storageBoxName);
      String nameInBox = hiveBox.get(Const.nameKey);
      name.value = nameInBox;
      print("name now: ${name.value}");
      print("namedb : ${nameInBox}");
    } catch (e) {
      print("error in get default name : $e");
    }

    super.onInit();
  }
}
