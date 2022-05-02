import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/cloth_title_bar.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/color_picker.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/sized_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  String imageUrl;

  ImageSliders({required this.imageUrl, Key? key}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final List<Color> colorList = [kCOlor1, kCOlor2, kCOlor3, kCOlor4, kCOlor5];
  int currentIndex = 0;
  int currentColor = 0;

  var carouselController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            itemBuilder: (context, index, realIndex) {
              return Container(

                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
                ),
              );
            },
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reson) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                viewportFraction: 1)),
        Positioned(
          bottom: 30,
          left: 170,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: colorList[index],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(
                    height: 3,
                  );
                },
                itemCount: colorList.length),
          ),
        ),


      ],
    );
  }
}
