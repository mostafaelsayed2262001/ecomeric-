import 'package:ecomerec/lib/logic/controllers/products_controller.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please Add your favorites products',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                    image: controller.favoritesList[index].image,
                    title: controller.favoritesList[index].title,
                    price: controller.favoritesList[index].price,
                    productId: controller.favoritesList[index].id);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length);
        }
      }),
      // body: ,
      /*body: ,*/
    );
  }

  Widget buildFavItems(
      {required String image,
      required double price,
      required String title,
      required int productId}) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 5),
      color: Get.isDarkMode?Colors.white.withOpacity(.1):Colors.white,
      width: double.infinity,
      height: 100,
      child: Row(children: [
        SizedBox(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  '$image',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: '$title ',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
                overFlow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              TextUtils(
                text: '\$ $price ',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
                overFlow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              controller.mangementFav(productId);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ))
      ]),
    );
  }
}
