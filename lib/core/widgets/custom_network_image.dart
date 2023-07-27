import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkCachedImage extends StatelessWidget {
  const CustomNetworkCachedImage(
      {super.key,
      required this.url,
      this.fit,
      this.filter,
      this.width,
      this.height});

  final String url;
  final BoxFit? fit;
  final ColorFilter? filter;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      // height: height,
      // color: ColorManager.amber,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.fill,
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
