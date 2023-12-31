import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view.dart';
import 'package:flutter_siin_shop/screens/main_screen/main_screen.dart';
import 'package:flutter_siin_shop/screens/product_detail_screen/product_detail_view.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final kRouterConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            Product p = state.extra as Product;
            return ProductDetailView(product: p);
          },
        ),
      ]
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) {
        return const CartView(hasBackButton: true,);
      },
    ),
  ],
);

