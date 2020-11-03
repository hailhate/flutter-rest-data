import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/widgets/blur_widget.dart';
import '../../../common/widgets/load_in_progress_widget.dart';
import '../../../models/beer.dart';
import '../../../models/ingredient.dart';
import '../../home/presentation/widgets/load_error_widget.dart';
import '../bloc/beer_details.dart';

class BeerDetailsPage extends StatelessWidget {
  final Beer beer;

  const BeerDetailsPage({this.beer, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: false,
                ),
                SliverToBoxAdapter(
                  child: _buildHeaderWidget(context, beer),
                ),
                SliverToBoxAdapter(
                  child: BlocProvider<BeerDetailsBloc>(
                    create: (_) => GetIt.I<BeerDetailsBloc>()
                      ..add(BeerDetailsEvent.load(beer.id)),
                    child: BlocBuilder<BeerDetailsBloc, BeerDetailsState>(
                      builder: (context, state) => state.map(
                        initial: (_) => _buildWidget(context, beer),
                        loadInProgress: (_) => _buildWidget(context, beer),
                        loadedSuccess: (loadSuccess) =>
                            _buildWidget(context, loadSuccess.beer),
                        loadFailure: (error) =>
                            LoadErrorWidget(error: error.beerError),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomSheet: Expanded(
          child: Container(
            height: 200,
            color: Colors.red,
            child: Text('Hello World'),
          ),
        ),
      );

  Widget _buildHeaderWidget(BuildContext context, Beer beer) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                // horizontal: 16.0,
                vertical: 0.0,
              ),
              child: Text(
                beer.name ?? 'Unknown',
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                beer.tagLine ?? 'Unknown',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildWidget(BuildContext context, Beer beer) => Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16.0,
          //     vertical: 0.0,
          //   ),
          //   child: Text(
          //     beer.name ?? 'Unknown',
          //     textAlign: TextAlign.center,
          //     style: GoogleFonts.lora(
          //       textStyle: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 28.0,
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16.0,
          //     vertical: 8.0,
          //   ),
          //   child: Text(
          //     beer.tagLine ?? 'Unknown',
          //     textAlign: TextAlign.center,
          //     style: GoogleFonts.nunito(
          //       textStyle: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18.0,
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 8.0,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAlcoholWidget(context),
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      BlocBuilder<BeerDetailsBloc, BeerDetailsState>(
                        builder: (context, state) => state.map(
                          initial: (_) =>
                              _buildIngredientsWidget(context, beer),
                          loadInProgress: (_) => const LoadInProgressWidget(),
                          loadedSuccess: (loadSuccess) =>
                              _buildIngredientsWidget(
                                  context, loadSuccess.beer),
                          loadFailure: (error) =>
                              LoadErrorWidget(error: error.beerError),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Column(
                  children: [
                    Container(
                      // color: Colors.brown,
                      constraints:
                          const BoxConstraints(maxWidth: 144, maxHeight: 320),
                      child: BottleWidget(imageUrl: beer.imageURL),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildDescriptionWidget(context),
          ),
        ],
      );

  Widget _buildPairingWidget(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good tastes with',
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          if (beer.foodPairing != null)
            ...beer.foodPairing
                .map(
                  (dynamic pairing) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 16.0,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Text(
                            '$pairing',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList()
        ],
      );

  Widget _buildIngredientsWidget(BuildContext context, Beer beer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          if (beer.ingredients != null)
            ...beer.ingredients
                .map(
                  (Ingredient ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        // const Icon(
                        //   Icons.circle,
                        //   size: 16.0,
                        //   color: Colors.amber,
                        // ),
                        // const SizedBox(
                        //   width: 8.0,
                        // ),
                        Expanded(
                          child: Text(
                            '${ingredient.name} - ${ingredient.qty} ${ingredient.unit}',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
        ],
      );

  Widget _buildAlcoholWidget(BuildContext context) => Container(
        // width: 56.0,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Alcohol',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              '${beer.alcoholByVolume} %',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(251, 109, 85, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildDescriptionWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              textAlign: TextAlign.justify,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              beer.description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      );
}
