import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/home/card_items.dart';
import 'package:ecomerec/lib/view/widgets/home/search_form_text.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

    const HomeScreen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  const TextUtils(
                      text: 'Find Your ',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextUtils(
                      text: 'INSPIRATION',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,

              child: TextUtils(
                  text: 'Categorys',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Get.isDarkMode?Colors.white:Colors.black),
            ),
          ),
          const SizedBox(height: 30 ,),
           CardItems(),

        ]),
      ),
    );
  }
}
