import 'dart:async';

import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/models/category_model.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/repositories/products_api.dart';
import 'package:flutter_siin_shop/utils/helper_functions.dart';
import 'package:stacked/stacked.dart';

class CategoryViewModel extends BaseViewModel {
  late ProductsApi _productApi;
  List<Product> _products = [];
  List<Category> categoryList = [];
  String _searchText = "";
  Category? _filterCategory;
  Timer? _debounce;

  CategoryViewModel() {
    _productApi = locator<ProductsApi>();
    load();
  }

  Future<void> load() async {
    _products = await _productApi.getProducts();
    categoryList = await _productApi.getCategories();
  }

  actionFilterCat(Category? cat){
    _filterCategory = cat;
    notifyListeners();
  }

  actionFilterSearch(String val){
    dPrint("actionFilterSearch $val");
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchText = val;
      _searchText = val;
      notifyListeners();
    });
  }

  Category? get selectedCategory => _filterCategory;

  List<Product> get productList {
    if (_searchText.trim().isNotEmpty && _filterCategory != null) {
      return _products
          .where((element) =>
              (element.title.toLowerCase().contains(_searchText.toLowerCase()) ||  element.description.toLowerCase().contains(_searchText.toLowerCase())) &&
              element.category == categoryValues.map[_filterCategory!.name]!)
          .toList();
    }

    if (_filterCategory != null) {
      return _products
          .where((element) => element.category == categoryValues.map[_filterCategory!.name]!)
          .toList();
    }

    if (_searchText.trim().isNotEmpty) {
      return _products
          .where((element) =>
              element.title.toLowerCase().contains(_searchText.toLowerCase()) ||  element.description.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }

    return _products;
  }

}
