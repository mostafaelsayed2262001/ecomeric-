import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/routes/routes.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/add_cart.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/cloth_title_bar.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/image_sliders.dart';
import 'package:ecomerec/lib/view/widgets/productDetails/sized_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  final ProductModels productModels;

  const ProductScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios,color: Get.isDarkMode?Colors.white:Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.cartScreen);
              },
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            )
          ],
          backgroundColor: context.theme.backgroundColor,
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            ImageSliders(
              imageUrl: widget.productModels.image,
            ),
            ClouthTitleBar(
              title: widget.productModels.title,
              productId: widget.productModels.id,
              description: widget.productModels.description,
            ),
            SizedList(),
            AddCart(price: widget.productModels.price, productModels: widget.productModels)
          ],
        )),
      ),
    );
  }
}
