import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/widgets/app_button.dart';
import 'package:flutter_siin_shop/widgets/video_product_thumbnail.dart';

class VideoDescription extends StatelessWidget {
  final username;
  final videtoTitle;
  final songInfo;

  VideoDescription(this.username, this.videtoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130.0,
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
                    SizedBox(height: 3.0,),
                    Text(
                      "Pro-Collagen Marine lorem ipsum dolor ismet which odor vue te lorem",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade300),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Text("BD 16.82",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade300),),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("BD 26.30", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade400),),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: KAppButton(
                            onPressed: () {}, child: const Text("Add to Cart")))
                  ],
                ),
              ),
            ]));
  }
}
