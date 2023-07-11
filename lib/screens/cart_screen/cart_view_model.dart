import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/models/cart_model.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  double totalAmount = 10.99;
  int totalItem = 1;
  /// it could be empty added a default product to cart
  /// for demonstration purpose
  Map<int, CartModel> _cartItems = {
    8: CartModel(
      product: Product.fromJson(
        {
          "id": 8,
          "title": "Pierced",
          "description": "Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
          "price": 10.99,
          "old_price": 13.188,
          "off": 20,
          "category": "jewelery",
          "image": "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg"
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
