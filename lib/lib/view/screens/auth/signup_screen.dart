import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_text_field.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_widget_buttom.dart';
import 'package:ecomerec/lib/view/widgets/auth/check_box.dart';
import 'package:ecomerec/lib/view/widgets/auth/text_under.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController ctrlUser = TextEditingController();
  final TextEditingController ctrlEmail = TextEditingController();
  final TextEditingController ctrlPassword = TextEditingController();
  final controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ?  darkGreyClr:Colors.white,
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
                    key: formKey,
                    child: Column(
                      children: [
                        //signup
                        Row(
                          children: [
                            TextUtils(
                                text: 'SIGN',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Get.isDarkMode ?  pinkClr:mainColor),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: 'Up',
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Get.isDarkMode
                                    ? Colors.white: Colors.black),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: ctrlUser,
                          secure: false,
                          prefix: Get.isDarkMode
                              ? const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: pinkClr,
                                )
                              : Image.asset(
                                  'assets/images/user.png',
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'User Name',
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name ';
                            } else {
                              return null;
                            }
                          },
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
                              return 'Invalid valid name ';
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
                        const SizedBox(
                          height: 40,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 40,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthWidget(
                              text: 'Sign Up',
                              onPressed: () {
                                if (controller.isCheckBox == false) {
                                  Get.snackbar('Check Box',
                                      'Please ,Accept Terms & Conditions',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white);
                                } else if (formKey.currentState!.validate()) {
                                  controller.signUpAuth(
                                      name: ctrlUser.text.trim(),
                                      email: ctrlEmail.text.trim(),
                                      password: ctrlPassword.text);
                                }
                              });
                        })
                      ],
                    ),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
              ),
              TextUnder(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                text: 'Already Have an Account?',
                textBTN: ' Log in',
              )
            ],
          ),
        ),
      ),
    );
  }
}
