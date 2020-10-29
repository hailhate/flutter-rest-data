import 'package:dartz/dartz.dart';

import '../../../../models/beer.dart';
import '../../../home/domain/beer_error.dart';

abstract class BeerDetailsRepository {
  Future<Either<BeerError, Beer>> beerDetails(String index);
}
