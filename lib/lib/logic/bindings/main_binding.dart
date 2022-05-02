import 'package:ecomerec/lib/logic/controllers/main_controller.dart';
import 'package:ecomerec/lib/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
  Get.put(MainController());
  Get.put(SettingController());
  }


}