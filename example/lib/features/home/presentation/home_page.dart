import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/widgets/load_in_progress_widget.dart';
import '../../../models/beer.dart';
import '../../beer_list/presentation/beer_list_page.dart';
import '../bloc/beers_state.dart';
import '../bloc/home.dart';
import '../presentation/widgets/load_error_widget.dart';
import '../presentation/widgets/switch_widget.dart';
import 'widgets/load_beers_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers API Client'),
      ),
      body: BlocProvider<HomeBloc>(
        create: (_) => GetIt.I<HomeBloc>(),
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (p, c) =>
                  p.simulateOfflineIsOn != c.simulateOfflineIsOn,
              builder: (context, state) => SwitchWidget(
                title: 'Simulate Offline',
                content: state.simulateOfflineIsOn,
                onChanged: (isOn) {
                  BlocProvider.of<HomeBloc>(context).add(
                    HomeEvent.simulateOffline(isOn),
                  );
                },
              ),
            ),
            Expanded(
              child: Center(
                child: BlocConsumer<HomeBloc, HomeState>(
                  listenWhen: (p, c) => p.beerState != c.beerState,
                  listener: (context, state) {
                    state.beerState.maybeWhen(
                      loadedSuccess: (loadSuccess) {
                        final List<Beer> beers =
                            (state.beerState as LoadSuccess).beers;
                        _openBeerListPage(context, beers);
                      },
                      orElse: () {},
                    );
                  },
                  buildWhen: (p, c) => p.beerState != c.beerState,
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: state.beerState.map(
                      initial: (_) => const LoadBeersButton(),
                      loadInProgress: (_) => const LoadInProgressWidget(),
                      loadedSuccess: (loadSuccess) => const LoadBeersButton(),
                      loadFailure: (error) => LoadErrorWidget(error: error),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openBeerListPage(BuildContext context, List<Beer> beers) {
    Navigator.of(context).push<BeerListPage>(
      MaterialPageRoute(builder: (context) => BeerListPage(beers: beers)),
    );
  }
}
