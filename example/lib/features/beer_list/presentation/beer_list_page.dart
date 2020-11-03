import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/beer.dart';
import '../../beer_details/presentation/beer_details_page.dart';
import 'widgets/beer_widget.dart';

class BeerListPage extends StatelessWidget {
  final List<Beer> beers;

  const BeerListPage({Key key, this.beers}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: const Color.fromRGBO(245, 243, 240, 1.0),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Drinks',
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
              pinned: true,
              floating: true,
            ),
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => BeerWidget(
                  beer: beers[index],
                  onTap: () => _openBeerDetailsPage(context, beers[index]),
                ),
                // Builds 1000 ListTiles
                childCount: beers.length,
              ),
            ),
          ],
        ),
      );

  void _openBeerDetailsPage(BuildContext context, Beer beer) {
    Navigator.of(context).push<BeerDetailsPage>(
      MaterialPageRoute(builder: (context) => BeerDetailsPage(beer: beer)),
    );
  }
}
