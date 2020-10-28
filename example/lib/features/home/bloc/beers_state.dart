import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/beer.dart';
import '../domain/beer_error.dart';

part 'beers_state.freezed.dart';

@freezed
@immutable
abstract class BeersState with _$BeersState {
  const factory BeersState.initial() = Initial;
  const factory BeersState.loadInProgress() = DataTransferInProgress;
  const factory BeersState.loadedSuccess(List<Beer> beers) = LoadSuccess;
  const factory BeersState.loadFailure(BeerError beerError) = LoadError;
}
