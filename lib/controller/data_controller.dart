import 'package:get/get.dart';

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
}
