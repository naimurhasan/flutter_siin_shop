import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';
import 'package:flutter_siin_shop/models/product_model.dart';
import 'package:flutter_siin_shop/screens/product_detail_screen/product_detail_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  final int addedToCart;

  const ProductGridItem(
      {super.key, required this.product, this.addedToCart = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: KColors.primaryInactive)),
      child: InkWell(
        onTap: (){
          context.go('/detail', extra: product);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// thumbnail, badge, fav
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          height: 130,
                          padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                          child: Hero(
                            tag: 'product-img-${product.id}',
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl: product.image,
                              placeholder: (ctx, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child:  Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (product.off != 0)
                    Positioned(
                      top: 15.0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 1.0, 13, 1),
                        decoration: BoxDecoration(
                          color: KColors.badgeBg,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                        ),
                        child: Text(
                          "-${product.off}%",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0.0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1.0,
            ),

            /// product descriptions
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    product.description,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AutoSizeText.rich(
                          TextSpan(
                            text: 'BD ${product.price.toStringAsFixed(2)}  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                  fontWeight: FontWeight.normal,),
                            children: [
                              TextSpan(
                                text: 'BD ${product.oldPrice.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          minFontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      addedToCart == 0
                          ? Icon(
                              Icons.add_circle_outline_rounded,
                              color: Colors.grey.shade500,
                            )
                          : CircleAvatar(
                              radius: 10.0,
                              child: Text(
                                addedToCart.toString(),
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ),
                      SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
