import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  final ProductModels productModels;
   final int index ;
   final int quantity;
    CartProduct({required this.productModels,required this.index, Key? key, required this.quantity}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Container(
          height: 120,
          width: 100,
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(
                  productModels.image),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: productModels.title,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                overFlow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                  text: "\$ ${controller.productSubTotal[index]}",
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Get.isDarkMode ? Colors.white : Colors.black)
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.removeProductfromCart(productModels);
                  },
                  icon: Icon(Icons.remove_circle,color : Get.isDarkMode ? Colors.white : Colors.black,),
                ),
                TextUtils(
                    text: '$quantity',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black),
                IconButton(
                  onPressed: () {
                    controller.addProductToCart(productModels);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color : Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(onPressed: (){
              controller.removeProductfromCart(productModels);
            }, icon: Icon(Icons.delete,size: 25 ,color: Get.isDarkMode?Colors.black:Colors.red,))
          ],
        )
      ]),
    );
  }
}
