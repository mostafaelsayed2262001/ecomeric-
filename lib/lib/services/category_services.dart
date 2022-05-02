import 'package:ecomerec/lib/model/category_models.dart';
import 'package:ecomerec/lib/model/product_models.dart';
import 'package:ecomerec/lib/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future <List<String>> getCategory()async{
    var response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if(response.statusCode == 200){
      var jsonData= response.body;
      return categoryModelsFromJson(jsonData);
    }
    else {
      return throw Exception('failed to load products ');
    }





  }
}


class AllCategoryServices {
  static Future <List<ProductModels>> categoryAllNamed(var categoryName)async{
    var response = await http.get(Uri.parse("$baseUrl/products/category/$categoryName"));
    if(response.statusCode == 200){
      var jsonData= response.body;
      return productModelsFromJson(jsonData);
    }
    else {
      return throw Exception('failed to load products ');
    }





  }
}