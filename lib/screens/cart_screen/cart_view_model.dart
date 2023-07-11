import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/models/cart_model.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  double totalAmount = 109.95;
  int totalItem = 1;
  Map<int, CartModel> _cartItems = {
    1: CartModel(
      product: Product.fromJson(
        {
          "id": 1,
          "title": "Fjallraven",
          "description":
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          "price": 109.95,
          "old_price": 131.94,
          "off": 20,
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
        },
      ),
      colorVariation: Colors.red,
      quantity: 1,
    ),
  };

  Map<int, CartModel> get cartItems => _cartItems;

  void addToCart(Product product, {Color? colorVariation, int quantity = 1}) {
    // if product already exists in cart, increment quantity
    if (_cartItems.containsKey(product.id)) {
      _cartItems.update(
          product.id,
          (existingProduct) => CartModel(
              product: product,
              colorVariation: colorVariation ?? existingProduct.colorVariation,
              quantity: existingProduct.quantity + quantity));
    } else {
      _cartItems.putIfAbsent(
          product.id,
          () => CartModel(
              product: product,
              colorVariation: colorVariation,
              quantity: quantity));
    }
    totalAmount += product.price * quantity;
    totalItem += quantity;
    notifyListeners();
  }

  void reduceQuantity(Product product) {
    if (_cartItems.containsKey(product.id)) {
      if (_cartItems[product.id]!.quantity > 1) {
        _cartItems.update(
            product.id,
            (existingProduct) => CartModel(
                product: product,
                colorVariation: existingProduct.colorVariation,
                quantity: existingProduct.quantity - 1));
        totalAmount -= product.price;
        totalItem -= 1;
        notifyListeners();
      }
    }
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product.id)) {
      totalAmount -= product.price * _cartItems[product.id]!.quantity;
      totalItem -= _cartItems[product.id]!.quantity;
      _cartItems.remove(product.id);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    totalAmount = 0.0;
    totalItem = 0;
    notifyListeners();
  }
}
