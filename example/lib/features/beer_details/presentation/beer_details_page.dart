import 'package:example/common/widgets/load_in_progress_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../models/beer.dart';
import '../../home/presentation/widgets/load_error_widget.dart';
import '../bloc/beer_details.dart';

class BeerDetailsPage extends StatelessWidget {
  final Beer beer;

  const BeerDetailsPage({this.beer, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers API Client'),
      ),
      body: BlocProvider<BeerDetailsBloc>(
        create: (_) =>
            GetIt.I<BeerDetailsBloc>()..add(BeerDetailsEvent.load(beer.id)),
        child: Center(
          child: BlocBuilder<BeerDetailsBloc, BeerDetailsState>(
            builder: (context, state) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: state.map(
                initial: (_) => const Text('DETAILS'),
                loadInProgress: (_) => const LoadInProgressWidget(),
                loadedSuccess: (loadSuccess) => const Text('DETAILS'),
                loadFailure: (error) => LoadErrorWidget(error: error.beerError),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
