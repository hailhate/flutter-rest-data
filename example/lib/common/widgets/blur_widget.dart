import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BottleWidget extends StatelessWidget {
  final String imageUrl;
  final EdgeInsets padding;
  final double blur;

  const BottleWidget({
    Key key,
    this.imageUrl,
    this.blur = 6.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Padding(
            padding: padding,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fitHeight,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                margin: padding,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      );
}
