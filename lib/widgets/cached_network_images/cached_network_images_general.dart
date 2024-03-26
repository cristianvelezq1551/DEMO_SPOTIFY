import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_spotify/widgets/loading/loading_general.dart';
import 'package:flutter/material.dart';

class CachedNetworkImagesGeneral extends StatelessWidget {
  const CachedNetworkImagesGeneral(
      {super.key, required this.imageUrl, this.size = 50});

  final String? imageUrl;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(8), // Ajusta el radio según lo necesites
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const LoadingGeneral(), // O cualquier otro widget de carga
      errorWidget: (context, url, error) =>
          const Icon(Icons.image_outlined), // O cualquier otro widget de error
    );
  }
}
