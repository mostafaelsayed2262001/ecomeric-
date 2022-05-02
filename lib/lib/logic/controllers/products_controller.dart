import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/model/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isloading = true.obs;
  var storage = GetStorage();


  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = storage.read<List>('isFavSaved');

    if (storedShoppings != null) {
      favoritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isloading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isloading(false);
    }
  }

  //logic fav

  bool isFavotites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  void mangementFav(var productId) async {
    var existingFav =
        favoritesList.indexWhere((element) => element.id == productId);
    if (existingFav >= 0) {
      favoritesList.removeAt(existingFav);
      storage.remove('isFavSaved');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write('isFavSaved', favoritesList);
    }
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
