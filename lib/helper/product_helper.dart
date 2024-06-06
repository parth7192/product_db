import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_db/modal/product_modal.dart';

class productHelper {
  productHelper._();
  static productHelper apihelper = productHelper._();

  String ApiLink = "https://dummyjson.com/products";

  Future<List<Products>> getapi() async {
    List<Products> products = [];
    var response = await http.get(Uri.parse(ApiLink));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List product = data['products'];
      products = product.map((e) => Products.fromJson(e)).toList();
    }
    return products;
  }
}
