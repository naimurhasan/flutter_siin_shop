import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siin_shop/constants/color_const.dart';

class VideoProductThumbnail extends StatelessWidget {
  final String imageUrl;
  final int? off;

  const VideoProductThumbnail({super.key, required this.imageUrl, this.off});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          if (off != null)
            Positioned(
              top: 5.0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8.0, 1.0, 13, 1),
                decoration: BoxDecoration(
                  color: KColors.badgeBg,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: Text("-$off%", style: TextStyle(color: Colors.white),),
              ),
            )
        ],
      ),
    );
  }
}
