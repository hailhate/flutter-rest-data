import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
@immutable
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.simulateOffline(bool enabled) = SimulateOffline;
  const factory HomeEvent.load() = Load;
}
