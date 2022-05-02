import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = [].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;
  var categoryList = <ProductModels>[].obs;
  List imageList = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getAllCategorys(var nameCategory) async {
    var categoryName = await AllCategoryServices.categoryAllNamed(nameCategory);
    try {
      isAllCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryList.value = categoryName;
      }
    } finally {
      isAllCategoryLoading(false);
    }
  }
}
