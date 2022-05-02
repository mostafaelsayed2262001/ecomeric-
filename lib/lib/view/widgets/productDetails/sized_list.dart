import 'package:ecomerec/lib/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizedList extends StatefulWidget {
  SizedList({Key? key}) : super(key: key);

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', '2XL', '3XL'];

  var currentSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {

                  currentSelected = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2,
                  ),
                  color: currentSelected==index? Get.isDarkMode?Colors.black.withOpacity(0.8):mainColor.withOpacity(0.5) :null,
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: sizeList.length),
    );
  }
}
