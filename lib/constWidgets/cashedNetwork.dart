import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkModel(String url) => CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(
        'assets/logo/logo.png',
        fit: BoxFit.fill,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/logo/logo.png',
        fit: BoxFit.fill,
      ),
      fit: BoxFit.fill,
    );
