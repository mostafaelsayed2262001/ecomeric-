import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image:
                            NetworkImage(authController.dislayUserPhoto.value),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: authController.displayUserName.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  TextUtils(
                      text: authController.dislayUserEmail.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ],
              )
            ],
          );
        })
      ],
    );
  }
}
