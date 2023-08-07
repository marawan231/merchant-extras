import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkCachedImage extends StatelessWidget {
  const CustomNetworkCachedImage(
      {super.key,
      this.url,
      this.fit,
      this.filter,
      this.width,
      this.height,
      this.color});

  final String? url;
  final BoxFit? fit;
  final ColorFilter? filter;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return url == null
        ? Container(
            width: width,
            height: height,
            color: color,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ))
        : CachedNetworkImage(
            width: width,
            height: height,
            color: color,
            // color: ColorManager.amber,
            imageUrl: url!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit ?? BoxFit.cover,
                  colorFilter: filter,
                ),
              ),
            ),
            // ColorFilter.mode(
            //           Colors.black.withOpacity(.4), BlendMode.darken)
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
              child: Container(
                width: width,
                height: height,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          );
  }
}
