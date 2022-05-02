import 'package:ecomerec/lib/logic/controllers/cart_controller.dart';
import 'package:ecomerec/lib/logic/controllers/products_controller.dart';
import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/utils/themes.dart';
import 'package:ecomerec/lib/view/screens/product_details.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isloading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.searchList.isEmpty? controller.productList.length:controller.searchList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                childAspectRatio: 0.8,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 9.0),
            itemBuilder: (context, index) {
              if (controller.searchList.isEmpty) {
                return BuildCard(
                  image: controller.productList[index].image,
                  price: controller.productList[index].price,
                  rating: controller.productList[index].rating.rate,
                  productId: controller.productList[index].id,
                  productModels: controller.productList[index],
                  onTap: () {
                    Get.to(() => ProductScreen(
                          productModels: controller.productList[index],
                        ));
                  },
                );
              } else {
                return BuildCard(
                    image: controller.searchList[index].image,
                    price: controller.searchList[index].price,
                    rating: controller.searchList[index].rating.rate,
                    productId: controller.searchList[index].id,
                    productModels: controller.searchList[index],
                    onTap: () {
                      Get.to(() => ProductScreen(
                            productModels: controller.searchList[index],
                          ));
                    });
              }
            },
          ),
        );
      }
    });
  }

  Widget BuildCard(
      {required String image,
      required double price,
      required double rating,
      required int productId,
      required ProductModels productModels,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Get.isDarkMode
                      ? Colors.white
                      : Colors.grey.withOpacity(0.1),
                  spreadRadius: 3.0,
                )
              ]),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.mangementFav(productId);
                      },
                      icon: controller.isFavotites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  '$image',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils(
                                  text: '$rating',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white),
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Colors.white,
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
