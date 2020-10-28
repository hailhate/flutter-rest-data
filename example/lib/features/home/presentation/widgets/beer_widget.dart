import 'package:flutter/material.dart';

import '../../../../models/beer.dart';

class BeerWidget extends StatelessWidget {
  final Beer beer;

  const BeerWidget({Key key, this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8.0),
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
