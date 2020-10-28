import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/home.dart';
import '../presentation/widgets/beer_widget.dart';
import '../presentation/widgets/load_error_widget.dart';
import '../presentation/widgets/switch_widget.dart';

class HomePage extends StatelessWidget {
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
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (p, c) => p.beerState != c.beerState,
              builder: (context, state) => state.beerState.map(
                initial: (_) => RaisedButton(
                  onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                    const HomeEvent.load(),
                  ),
                  child: const Text('Load Beers'),
                ),
                loadInProgress: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loadedSuccess: (loadSuccess) => ListView.separated(
                  itemCount: loadSuccess.beers.length,
                  itemBuilder: (context, index) => BeerWidget(
                    beer: loadSuccess.beers[index],
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    color: Colors.grey.shade500,
                  ),
                ),
                loadFailure: (error) => LoadErrorWidget(error: error),
              ),
            )
          ],
        ),
      ),
    );
  }
}
