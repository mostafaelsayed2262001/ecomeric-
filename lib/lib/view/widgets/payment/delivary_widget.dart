import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class DelivaryContainerWidget extends StatefulWidget {
  const DelivaryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DelivaryContainerWidget> createState() =>
      _DelivaryContainerWidgetState();
}

class _DelivaryContainerWidgetState extends State<DelivaryContainerWidget> {
  int radioIndex = 1;
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            color: changeColor?Colors.white: Colors.grey.shade300,
            value: 1,
            onChange: (int? value ) {
              setState(() {
                radioIndex = value!;
                 changeColor= !changeColor;
              });
            },
            title: 'Devil Shop',
            name: 'Mostafa Elsayed',
            adress: 'Egypt,Dakahlya,Mansoura',
            phone: '01063031256'),
        SizedBox(height: 10,),
        buildRadioContainer(
            color: changeColor? Colors.grey.shade300:Colors.white,
            value: 2,
            onChange: (int? value ) {
              setState(() {
                radioIndex = value!;
                changeColor= !changeColor;
              });
            },
            title: 'Delivary ',
            name: 'Mostafa Elsayed',
            adress: 'Egypt,Dakahlya,Mansoura',
            phone: '01063031256'),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChange,
    required String title,
    required String name,
    required String phone,
    required String adress,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                spreadRadius: 3.0,
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            groupValue: radioIndex,
            onChanged: (int? value) {
              onChange(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: title,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: name,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: phone,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: adress,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
