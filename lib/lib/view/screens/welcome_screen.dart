import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/screens/auth/signup_screen.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
   const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 190,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child:  const Center(
                        child: TextUtils(
                      text: 'Welcome',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 240,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        TextUtils(
                          text: 'Devil ',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Get.isDarkMode? pinkClr:mainColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const TextUtils(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.loginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Get.isDarkMode? pinkClr:mainColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:   const TextUtils(
                        text: 'Get Start',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const TextUtils(
                        text: "Don't have an account?",
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white,

                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child:   TextUtils(
                            text: 'Sign Up',
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Get.isDarkMode? pinkClr:mainColor,
                            underline: TextDecoration.underline,

                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
