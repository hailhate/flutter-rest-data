import 'package:freezed_annotation/freezed_annotation.dart';

import 'beers_state.dart';

part 'home_state.freezed.dart';

@freezed
@immutable
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @required bool simulateOfflineIsOn,
    @required BeersState beerState,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      simulateOfflineIsOn: false,
      beerState: BeersState.initial(),
    );
  }
}
