
import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
   final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) { return Row(
        children: [
          InkWell(
            onTap: () {controller.CheckBox();},
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox? Get.isDarkMode? const Icon(Icons.done,color: pinkClr,):Image.asset('assets/images/check.png'):Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children:  [
              TextUtils(
                  text: 'I Accept ',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:Get.isDarkMode? Colors.white:Colors.black),
              TextUtils(
                  text: ' Terms & Conditions ',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:  Get.isDarkMode? Colors.white:Colors.black,underline: TextDecoration.underline,),
            ],
          ),

        ],
      );}
    );
  }
}
