import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/logic/controllers/category_controller.dart';
import 'package:ecomerec/lib/logic/controllers/products_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(ProductController());
  Get.lazyPut(() => CartController());
  Get.put(CategoryController());
  }

}