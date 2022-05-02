import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
            (){
        return Container(
            padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                      text: 'Totals',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey),
                  const SizedBox(height: 5,),
                  TextUtils(
                      text: "\$${controller.total}",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Get.isDarkMode?Colors.white:Colors.black),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Text('Check out',style: TextStyle(fontSize: 20),),
                        SizedBox(width: 10,),
                         Icon(Icons.shopping_cart),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Get.isDarkMode?pinkClr: mainColor),
                  ),
                  height: 60,
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
