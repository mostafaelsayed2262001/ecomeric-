import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:ecomerec/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PayMentMethodWidget> createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: 'Paypal',
              value: 1,
              image: 'assets/images/paypal.png',
              scale: 0.8,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: 'Google',
              value: 2,
              image: 'assets/images/google.png',
              scale: 0.8,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: 'Paypal',
              value: 3,
              image: 'assets/images/credit.png',
              scale: 0.8,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                  text: name,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
          ),
        ],
      ),
    );
  }
}
