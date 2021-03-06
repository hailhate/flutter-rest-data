import 'package:flutter/material.dart';

import '../../../models/beer.dart';
import 'widgets/beer_widget.dart';

class BeerListPage extends StatelessWidget {
  final List<Beer> beers;

  const BeerListPage({Key key, this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beer list'),
        ),
        body: ListView.separated(
          itemCount: beers.length,
          itemBuilder: (context, index) => BeerWidget(
            beer: beers[index],
            onTap: () => _openBeerDetailsPage(beers[index]),
          ),
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.grey.shade500,
          ),
        ),
      );

  void _openBeerDetailsPage(Beer beer) {}
}
