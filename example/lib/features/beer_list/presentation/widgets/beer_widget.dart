import 'package:flutter/material.dart';

import '../../../../models/beer.dart';

class BeerWidget extends StatelessWidget {
  final Beer beer;
  final VoidCallback onTap;

  const BeerWidget({Key key, this.beer, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              beer.name ?? 'Unknown',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            if (beer.description != null)
              Text(
                beer.description,
                style: Theme.of(context).textTheme.bodyText2,
              )
            else
              const SizedBox(),
          ],
        ),
      );
}
