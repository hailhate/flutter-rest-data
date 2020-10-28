import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../models/beer.dart';
import '../domain/beer_error.dart';
import '../domain/repository/beers_repository.dart';

@Injectable(as: BeersRepository)
class DefaultBeerRepository implements BeersRepository {
  @override
  Future<Either<BeerError, List<Beer>>> get allBeers =>
      throw UnimplementedError();
}
