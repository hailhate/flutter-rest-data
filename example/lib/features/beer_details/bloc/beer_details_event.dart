import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_details_event.freezed.dart';

@freezed
abstract class BeerDetailsEvent with _$BeerDetailsEvent {
  const factory BeerDetailsEvent.load(String index) = Load;
}
