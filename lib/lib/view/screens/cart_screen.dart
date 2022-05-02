import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/cart/cart_product.dart';
import 'package:ecomerec/lib/view/widgets/cart/cart_total.dart';
import 'package:ecomerec/lib/view/widgets/cart/empty_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Get.back();
                }),
            title: const Text('Cart Items'),
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.backspace,
                ),
                onPressed: () {
                  controller.clearAllProducts();
                },
              )
            ],
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 530,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProduct(
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                              index: index,
                              quantity:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: controller.productsMap.length),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
