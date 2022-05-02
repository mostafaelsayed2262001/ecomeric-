import 'package:ecomerec/lib/logic/controllers/auth_controller.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_text_field.dart';
import 'package:ecomerec/lib/view/widgets/auth/auth_widget_buttom.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final TextEditingController ctrlEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ?  darkGreyClr:Colors.white,
          centerTitle: true,
          title: Text(
            'forgot password',
            style: TextStyle(color: Get.isDarkMode ?  pinkClr:mainColor),
          ),
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
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Get.isDarkMode ?  Colors.white:darkGreyClr,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account,then please provide your email ID below ..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ?  Colors.white:darkGreyClr,
                        fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Image.asset('assets/images/forgetpass copy.png', width: 250,),
                  AuthTextFormField(
                    controller: ctrlEmail,
                    secure: false,
                    prefix: Get.isDarkMode
                        ?
                         const Icon(
                      Icons.email,
                      size: 30,
                      color: pinkClr,
                    ):Image.asset(
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
                  const SizedBox(height: 50,),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthWidget(text: 'Send Email', onPressed: () {
                      if(formKey.currentState!.validate()){
                        controller.resetPassword(ctrlEmail.text.trim());
                      }
                    });

                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
