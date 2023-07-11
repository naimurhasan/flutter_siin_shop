import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/injection_container.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/screens/cart_screen/cart_view_model.dart';
import 'package:flutter_siin_shop/widgets/app_button.dart';
import 'package:flutter_siin_shop/widgets/video_product_thumbnail.dart';
import 'package:stacked/stacked.dart';

class VideoDescription extends StatelessWidget {
  final username;
  final videtoTitle;
  final songInfo;

  VideoDescription(this.username, this.videtoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 135.0,
        decoration: BoxDecoration(
            color: Colors.black26, borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        padding: EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              VideoProductThumbnail(
                imageUrl:
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                off: 20,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Elemis",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade400,
                          ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Pro-Collagen Marine lorem ipsum dolor ismet which odor vue te lorem",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade300),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "BD 16.82",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade300),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "BD 26.30",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ViewModelBuilder<CartViewModel>.reactive(
                            disposeViewModel: false,
                            builder: (context, vm, child) {
                              /// useally the product would comes with video api
                              /// hardcoded for demonstration
                              final product = Product.fromJson({
                                "id": 1,
                                "title": "Fjallraven",
                                "description":
                                    "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                "price": 109.95,
                                "old_price": 131.94,
                                "off": 20,
                                "category": "men's clothing",
                                "image":
                                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
                              });
                              return vm.cartItems.containsKey(product.id)
                                  ? Container(
                                      child: Center(child: Text("Added")),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                    )
                                  : KAppButton(
                                      onPressed: () {
                                        locator<CartViewModel>().addToCart(
                                          product,
                                        );
                                      },
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                            },
                            viewModelBuilder: () => locator<CartViewModel>()))
                  ],
                ),
              ),
            ]));
  }
}
