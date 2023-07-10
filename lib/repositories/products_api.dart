import 'package:flutter_siin_shop/models/category_model.dart';
import 'package:flutter_siin_shop/models/product_model.dart';

abstract class ProductsApi{
  Future<List<Product>> getProducts();
  Future<List<Category>> getCategories();
}