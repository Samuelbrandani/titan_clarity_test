import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageLoadable extends StatelessWidget {
  final String? imageUrl;
  final bool? isPerson;
  final double? iconErrorSize;
  final double width;
  final double height;
  final BoxFit fit;
  final Alignment alignment;

  const CustomImageLoadable({
    this.fit = BoxFit.fill,
    this.alignment = Alignment.center,
    this.isPerson = false,
    this.iconErrorSize = 25,
    required this.imageUrl,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: imageUrl != null && imageUrl!.isNotEmpty,
      replacement: Icon(
        isPerson! ? Icons.person : Icons.broken_image_rounded,
        size: iconErrorSize,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fadeOutDuration: const Duration(milliseconds: 1000),
        fadeInDuration: const Duration(milliseconds: 500),
        fit: fit,
        alignment: alignment,
        placeholder: (_, __) => const ColoredBox(
          color: Colors.transparent,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (_, __, ___) => Icon(
          isPerson! ? Icons.person : Icons.broken_image_rounded,
          size: iconErrorSize,
        ),
      ),
    );
  }
}
