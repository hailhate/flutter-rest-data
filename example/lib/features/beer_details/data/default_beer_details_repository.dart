import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rest_data/flutter_rest_data.dart';
import 'package:injectable/injectable.dart';

import '../../../models/beer.dart';
import '../../home/domain/beer_error.dart';
import '../domain/repository/beer_details_repository.dart';

@Injectable(as: BeerDetailsRepository)
class DefaultBeerDetailsRepository implements BeerDetailsRepository {
  final PersistentJsonApiAdapter apiAdapter;

  DefaultBeerDetailsRepository(this.apiAdapter);

  @override
  Future<Either<BeerError, Beer>> beerDetails(String index) async {
    try {
      final Beer beer = Beer(
        await apiAdapter.find(
          'beers',
          index,
          forceReload: true,
        ),
      );
      return right(beer);
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
