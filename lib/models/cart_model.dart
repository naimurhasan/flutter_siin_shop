import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/models/product_model.dart';

class CartModel extends StatelessWidget {
  final Product product;
  final Color? colorVariation;
  final int quantity;
  const CartModel({super.key, required this.product, this.colorVariation, this.quantity = 1,});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
