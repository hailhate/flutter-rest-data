import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecases/load_beer_details.dart';
import 'beer_details.dart';

@injectable
class BeerDetailsBloc extends Bloc<BeerDetailsEvent, BeerDetailsState> {
  final LoadBeerDetails loadBeerDetails;

  BeerDetailsBloc(this.loadBeerDetails)
      : super(const BeerDetailsState.initial());

  @override
  Stream<BeerDetailsState> mapEventToState(BeerDetailsEvent event) async* {
    yield* event.map(
      load: _mapLoadBeerDetailsToState,
    );
  }

  Stream<BeerDetailsState> _mapLoadBeerDetailsToState(
    Load event,
  ) async* {
    yield const BeerDetailsState.loadInProgress();

    final result = await loadBeerDetails(event.index);
    yield result.fold(
      (error) => BeerDetailsState.loadFailure(error),
      (beer) => BeerDetailsState.loadedSuccess(beer),
    );
  }
}
