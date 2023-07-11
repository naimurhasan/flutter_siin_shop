import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDtViewModel extends BaseViewModel {
  Color? picked = Color(0xFFf5cfe9);


  actionChooseColor(Color? color){
    picked = color;
    notifyListeners();
  }
}