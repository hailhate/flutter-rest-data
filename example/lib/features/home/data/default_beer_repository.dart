import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rest_data/flutter_rest_data.dart';
import 'package:injectable/injectable.dart';

import '../../../models/beer.dart';
import '../domain/beer_error.dart';
import '../domain/repository/beers_repository.dart';

@Injectable(as: BeersRepository)
class DefaultBeerRepository implements BeersRepository {
  final PersistentJsonApiAdapter apiAdapter;

  DefaultBeerRepository(this.apiAdapter);

  @override
  Future<Either<BeerError, List<Beer>>> get allBeers async {
    try {
      final List<Beer> beers = (await apiAdapter.findAll('beers'))
          .map<Beer>((jsonApiDoc) => Beer(jsonApiDoc))
          .toList();

      return right(beers);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const BeerError.insufficientPermissions());
      } else {
        return left(BeerError.unexpected(e.message));
      }
    } on SocketException catch (_) {
      return left(const BeerError.missingNetwork());
    } on Exception catch (e) {
      return left(BeerError.unexpected(e.toString()));
    }
  }
}
