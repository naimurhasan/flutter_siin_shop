import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view_model.dart';
import 'package:flutter_siin_shop/screens/product_detail_screen/product_detail_view_model.dart';
import 'package:flutter_siin_shop/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDtViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ProductDtViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              product.title,
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              ViewModelBuilder<CartViewModel>.reactive(
                  disposeViewModel: false,
                  builder: (context, vm, child) {
                    return Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.push('/cart');
                            },
                            icon: Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.black,
                            )),
                        if(vm.totalItem > 0)
                        Positioned(
                          right: 2,
                          top: 2,
                          child: CircleAvatar(
                            radius: 10.0,
                            child: Text(
                              vm.totalItem.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 9.0),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  viewModelBuilder: () => locator<CartViewModel>()),

            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              /// product details
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 250,
                          child: Hero(
                            tag: 'product-img-${product.id}',
                            child: CachedNetworkImage(
                              imageUrl: product.image,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Medic",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(width: 10.0),
                                Icon(Icons.share)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Product Description",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 5),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          "Product Color",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 5),

                        /// demo purpose the variations are hardcoded
                        Row(
                          children: [
                            KColorVariationButton(
                              color: Color(0xFFf5cfe9),
                              onTap: (color) => model.actionChooseColor(color),
                              isSelected: model.picked == Color(0xFFf5cfe9),
                            ),
                            SizedBox(width: 5),
                            KColorVariationButton(
                              color: Color(0xFFa0824e),
                              onTap: (color) => model.actionChooseColor(color),
                              isSelected: model.picked == Color(0xFFa0824e),
                            ),
                            SizedBox(width: 5),
                            KColorVariationButton(
                                color: Color(0xFFbfe6eb), isDisabled: true),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// add to cart button
              Container(
                margin: const EdgeInsets.fromLTRB(1, 5, 1, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    'BD ${product.oldPrice.toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey.shade600),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 2.0),
                                  decoration: BoxDecoration(
                                    color: KColors.primary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  child: Text(
                                    '-${product.off}%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Text('BD ${product.price.toStringAsFixed(2)}  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                    )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: ViewModelBuilder<CartViewModel>.reactive(
                            disposeViewModel: false,
                            builder: (context, vm, child) {
                              return vm.cartItems.containsKey(product.id) ? ElevatedButton(onPressed: null, child: Text("Added")) : KAppButton(
                                onPressed: () {
                                  locator<CartViewModel>().addToCart(product,colorVariation: model.picked);
                                },
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                            viewModelBuilder: () => locator<CartViewModel>()),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
