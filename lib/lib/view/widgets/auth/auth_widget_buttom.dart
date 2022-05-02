import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWidget extends StatelessWidget {
  final String text;

  final Function() onPressed;

  const AuthWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:Get.isDarkMode?pinkClr:mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(text: text, fontWeight: FontWeight.bold , fontSize: 18, color: Colors.white),
    );
  }
}
