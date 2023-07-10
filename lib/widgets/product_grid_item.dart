import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';

class ProductGridItem extends StatelessWidget {
  final int? off;
  final int addedToCart;

  const ProductGridItem({super.key, this.off = 20, this.addedToCart = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: KColors.primaryInactive)),
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
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl:
                              "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                        ),
                      ),
                    ),
                  ],
                ),
                if (off != null)
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
                        "-$off%",
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
              children: [
                Text(
                  "Elemis",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade500,
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
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "BD 16.82",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade700),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          "BD 26.30",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                    Spacer(),
                    addedToCart == 0
                        ? Icon(
                            Icons.add_circle_outline_rounded,
                            color: Colors.grey.shade500,
                          )
                        : CircleAvatar(
                            radius: 10.0,
                            child: Text(addedToCart.toString(), style: TextStyle(fontSize: 10.0),),
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
    );
  }
}
