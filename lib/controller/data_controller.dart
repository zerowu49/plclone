import 'package:get/get.dart';

enum platformEnum { tokped, gojek, mytelkomsel, shopee, pl }

class DataController extends GetxController {
  RxString name = "".obs;
  RxString nik = "".obs;
  RxString place = "".obs;
  RxString kategori = "".obs;
  Rx<platformEnum> platform = platformEnum.gojek.obs;
  RxBool checkbox = true.obs;

  RxBool enableValidator = false.obs;
}
