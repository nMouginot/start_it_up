import 'package:flutter/material.dart';

ImageProvider themeImageProvider(String pathOrUrl) {
  if (pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://')) {
    return NetworkImage(pathOrUrl);
  }
  return AssetImage(pathOrUrl);
}

Widget themeImage(String pathOrUrl, {double? height, BoxFit? fit}) {
  if (pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://')) {
    return Image.network(
      pathOrUrl,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
    );
  }
  return Image.asset(
    pathOrUrl,
    height: height,
    fit: fit,
    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
  );
}
