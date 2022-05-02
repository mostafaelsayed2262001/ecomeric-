import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 170,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                  text: 'Your Cart is ',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                width: 10,
              ),
              TextUtils(
                  text: 'Empty ',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Get.isDarkMode ? pinkClr : mainColor),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
              text: 'Add items to get Started',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Get.isDarkMode ? Colors.white : Colors.black),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.mainScreen);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                child: const Text(
                  'Go to Home',
                  style:TextStyle(fontSize: 18,),
                )),
          ),
        ],
      ),
    );
  }
}
