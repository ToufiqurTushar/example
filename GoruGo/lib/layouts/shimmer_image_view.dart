import 'package:cowmaster/layouts/ripple_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

Widget ShimmerImageView({
  required String imageUrl,
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
  BorderRadius? borderRadius,
}) {
  final image = CachedNetworkImage(
    imageUrl: imageUrl,
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) => RippleShimmer(
      width: width??100,
      height: height??100,
      borderRadius: borderRadius,
    ),
    errorWidget: (context, url, error) => Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Icon(Icons.error, color: Colors.red, size: 40),
    ),
  );

  return borderRadius != null
      ? ClipRRect(borderRadius: borderRadius, child: image)
      : image;
}
