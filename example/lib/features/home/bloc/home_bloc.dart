import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecases/load_all_beers.dart';
import 'beers_state.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadAllBeers loadAllBeers;

  HomeBloc(this.loadAllBeers) : super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.map(
      simulateOffline: _mapSimulateOfflineToState,
      load: _mapLoadBeersToState,
    );
  }

  Stream<HomeState> _mapSimulateOfflineToState(
    SimulateOffline event,
  ) async* {
    yield state.copyWith(simulateOfflineIsOn: event.enabled);
  }

  Stream<HomeState> _mapLoadBeersToState(
    Load event,
  ) async* {
    yield state.copyWith(beerState: const BeersState.loadInProgress());

    final result = await loadAllBeers();
    yield result.fold(
      (error) => state.copyWith(beerState: BeersState.loadFailure(error)),
      (beers) => state.copyWith(beerState: BeersState.loadedSuccess(beers)),
    );
  }
}
