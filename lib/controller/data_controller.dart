import 'package:get/get.dart';

enum platformEnum { tokped, gojek, mytelkomsel, shopee }

class DataController extends GetxController {
  RxString name = "".obs;
  RxString nik = "".obs;
  RxString place = "".obs;
  RxString kategori = "".obs;
  Rx<platformEnum> platform = platformEnum.gojek.obs;
  RxBool checkbox = false.obs;
}
