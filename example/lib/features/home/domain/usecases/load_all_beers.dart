import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/beer.dart';
import '../beer_error.dart';
import '../repository/beers_repository.dart';

@injectable
class LoadAllBeers {
  final BeersRepository repository;

  LoadAllBeers(this.repository);

  Future<Either<BeerError, List<Beer>>> call() => repository.allBeers;
}
