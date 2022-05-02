import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';

import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    
  }

}