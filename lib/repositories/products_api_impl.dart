import 'package:flutter_siin_shop/models/category_model.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/repositories/data/category_demo_data.dart';
import 'package:flutter_siin_shop/repositories/data/product_demo_data.dart';
import 'package:flutter_siin_shop/repositories/products_api.dart';

class ProductsApiImpl extends ProductsApi{
  @override
  Future<List<Category>> getCategories() async{
    var list = <Category>[];

    categoryDemoData.forEach((element) {
      final data = Category.fromJson(element);
      list.add(data);
    });

    return list;
  }

  @override
  Future<List<Product>> getProducts() async{
    var list = <Product>[];

    productDemoData.forEach((element) {
      final data = Product.fromJson(element);
      list.add(data);
    });

    return list;
  }

}