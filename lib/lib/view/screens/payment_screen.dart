import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/payment/delivary_widget.dart';
import 'package:ecomerec/lib/view/widgets/payment/payment_method.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment '),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: 'Shiping to ',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            DelivaryContainerWidget(),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              text: 'Payment Method ',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            PayMentMethodWidget(),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: TextUtils(
                  text: 'Total 200 \$',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Pay Now',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode?pinkClr:mainColor
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
