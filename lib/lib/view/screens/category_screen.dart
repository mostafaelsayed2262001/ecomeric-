import 'package:ecomerec/lib/view/widgets/category/category_widget.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 15, top: 15),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15,bottom: 20),
            child:  TextUtils(
                text: "Category",
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Get.isDarkMode ? Colors.white :Colors.black),
          ),
        ),
        CategoryWidget(),
      ]),
    );
  }
}
