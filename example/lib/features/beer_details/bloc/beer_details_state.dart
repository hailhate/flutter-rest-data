import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/beer.dart';
import '../../home/domain/beer_error.dart';

part 'beer_details_state.freezed.dart';

@freezed
abstract class BeerDetailsState with _$BeerDetailsState {
  const factory BeerDetailsState.initial() = Initial;
  const factory BeerDetailsState.loadInProgress() = DataTransferInProgress;
  const factory BeerDetailsState.loadedSuccess(Beer beer) = LoadSuccess;
  const factory BeerDetailsState.loadFailure(BeerError beerError) = LoadError;
}
