import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productmodel) {
    if (productsMap.containsKey(productmodel)) {
      productsMap[productmodel] += 1;

    } else {
      productsMap[productmodel] = 1;

    }
  }

  void removeProductfromCart(ProductModels productmodel) {
    if (productsMap.containsKey(productmodel) &&
        productsMap[productmodel] == 1) {
      productsMap.removeWhere((key, value) => key == productmodel);
    } else {
      productsMap[productmodel] -= 1;
    }
  }

  void removeOneProduct(ProductModels productmodel) {
    productsMap.removeWhere((key, value) => key == productmodel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(10),
        title: 'Delete Products from list',
        titlePadding: const EdgeInsets.all(15),
        titleStyle: TextStyle(
          fontSize: 22,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: 'Are u sure you wants to delete all products?',
        middleTextStyle: TextStyle(
          fontSize: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.black,
        textConfirm: 'Yes',
        confirmTextColor: Colors.black,
        onCancel: () {
          Get.toNamed(Routes.cartScreen);
        },
        onConfirm: () {
          productsMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
  }
}
