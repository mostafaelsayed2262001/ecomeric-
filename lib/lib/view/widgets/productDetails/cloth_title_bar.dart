import 'package:ecomerec/lib/logic/controllers/products_controller.dart';
import 'package:ecomerec/lib/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClouthTitleBar extends StatelessWidget {
  ClouthTitleBar(
      {required this.title,
      required this.productId,
      required this.description,
      Key? key})
      : super(key: key);
  String title;
  String description;
  int productId;

  final conroller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextUtils(
                  text: title,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  overFlow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      conroller.mangementFav(productId);
                    },
                    child: conroller.isFavotites(productId)
                        ? const Icon(Icons.favorite,
                            color: Colors.red, size: 20)
                        : const Icon(Icons.favorite_border_outlined,
                            color: Colors.black, size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            height: 1.5),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.grey : Colors.grey,
            ),
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.grey : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
