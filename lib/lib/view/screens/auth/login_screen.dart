import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_text_field.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_widget_buttom.dart';

import 'package:ecomerec/lib/view/widgets/auth/text_under.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());
  final controler = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();
  final TextEditingController ctrlEmail = TextEditingController();
  final TextEditingController ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Get.isDarkMode ?  Colors.white:Colors.black,
              )),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        //signup
                        Row(
                          children: [
                            TextUtils(
                                text: 'LOG',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Get.isDarkMode ? pinkClr : mainColor),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: 'IN',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(
                          controller: ctrlEmail,
                          secure: false,
                          prefix: Get.isDarkMode
                              ? const Icon(
                                  Icons.email,
                                  size: 30,
                                  color: pinkClr,
                                )
                              : Image.asset(
                                  'assets/images/email.png',
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'Your Email',
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid  name ';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: ctrlPassword,
                            secure: controller.isvisiblity ? false : true,
                            prefix: Get.isDarkMode
                                ? const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: pinkClr,
                                  )
                                : Image.asset(
                                    'assets/images/lock.png',
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visiblity();
                              },
                              icon: controller.isvisiblity
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: 'Password',
                            validator: (value) {
                              if (value.toString().length <= 6) {
                                return 'password should be longer or equalto 6 charaters';
                              } else {
                                return null;
                              }
                            },
                          );
                        }),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                                text: 'forget password?',
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : darkGreyClr,),
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        GetBuilder<AuthController>(builder: (_) {
                          return AuthWidget(
                              text: 'LOG IN',
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  controller.logInAuth(
                                      email: ctrlEmail.text.trim(),
                                      password: ctrlPassword.text.trim());
                                }
                              });
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            text: 'OR',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Get.isDarkMode ? Colors.white : darkGreyClr),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                  child:
                                      Image.asset('assets/images/google.png'),
                                  onTap: () {
                                    controler.googleSignUp();
                                  });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
              ),
              TextUnder(
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
                text: "Don't Have an Account?",
                textBTN: ' Sign Up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
