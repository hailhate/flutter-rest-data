import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/beer.dart';
import '../../../home/domain/beer_error.dart';
import '../repository/beer_details_repository.dart';

@injectable
class LoadBeerDetails {
  final BeerDetailsRepository repository;

  LoadBeerDetails(this.repository);

  Future<Either<BeerError, Beer>> call(String index) =>
      repository.beerDetails(index);
}
