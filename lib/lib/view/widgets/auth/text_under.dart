import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextUnder extends StatelessWidget {
  final String text;
  final String textBTN;
  final Function() onPressed;

   const TextUnder({Key? key, required this.text, required this.textBTN,required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(.0),
      height: 80,
      width: double.infinity,alignment: AlignmentDirectional.center,
      decoration:  BoxDecoration(
        color: Get.isDarkMode? pinkClr:mainColor,
        
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),

        ),
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(

              text: text,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textBTN,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              underline: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
