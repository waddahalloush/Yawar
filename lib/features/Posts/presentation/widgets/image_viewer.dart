import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yawar_test/Core/Config/Extensions/media_query_ex.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        width: context.width, height: 200, fit: BoxFit.cover,
        imageUrl: url,
        errorWidget: (context, url, error) =>
            Image.asset("assets/images/logo.png"),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
        // errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
