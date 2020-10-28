import 'package:dartz/dartz.dart';

import '../../../../models/beer.dart';
import '../beer_error.dart';

abstract class BeersRepository {
  Future<Either<BeerError, List<Beer>>> get allBeers;
}
