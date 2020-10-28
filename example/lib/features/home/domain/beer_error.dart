import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_error.freezed.dart';

@freezed
@immutable
abstract class BeerError with _$BeerError {
  const factory BeerError.unexpected(String error) = Unexpected;
  const factory BeerError.missingNetwork() = MissingNetwork;
  const factory BeerError.insufficientPermissions() = InsufficientPermissions;
}
