import 'package:flutter/cupertino.dart';
import 'package:product_db/helper/product_helper.dart';
import 'package:product_db/modal/product_modal.dart';

class ProductController extends ChangeNotifier {
  List<Products> allproducts = [];

  ProductController() {
    getProducts();
  }

  getProducts() async {
    allproducts = await productHelper.apihelper.getapi();
    notifyListeners();
  }
}
