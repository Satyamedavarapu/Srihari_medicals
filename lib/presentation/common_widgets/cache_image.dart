import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';

class BuildCachedNetworkImage extends StatelessWidget {
  final String networkImage;
  final BoxFit? fit;
  final double? height, width;
  const BuildCachedNetworkImage(
      {super.key,
      required this.networkImage,
      this.fit,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: networkImage,
      fit: fit ?? BoxFit.fill,
      height: height ?? context.height * 0.1,
      width: width ?? context.width * 0.1,
      filterQuality: FilterQuality.high,
      fadeInCurve: Curves.easeIn,
      fadeInDuration: const Duration(milliseconds: 300),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(
              value: downloadProgress.progress, color: context.darkGreen),
      errorWidget: (context, string, object) {
        return Image.asset(
          AssetPaths.noImage,
          filterQuality: FilterQuality.high,
          fit: fit ?? BoxFit.fill,
          height: height ?? context.height * 0.1,
          width: width ?? context.width * 0.1,
        );
      },
    );
  }
}
