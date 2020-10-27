import 'package:flutter_rest_data/flutter_rest_data.dart';

class Beer extends JsonApiModel {
  Beer(JsonApiDocument doc) : super(doc);
  Beer.init(String type) : super.init(type);

  String get name => attributes['name'] as String;
  set name(String value) => attributes['name'] = value;

  String get tagLine => attributes['tagline'] as String;
  set tagLine(String value) => attributes['tagline'] = value;

  String get description => attributes['description'] as String;
  set description(String value) => attributes['description'] = value;

  String get imageURL => attributes['image_url'] as String;
  set imageURL(String value) => attributes['image_url'] = value;

  String get alcoholByVolume => attributes['alcohol_by_volume'] as String;
  set alcoholByVolume(String value) => attributes['alcohol_by_volume'] = value;

  String get foodPairing => attributes['food_pairing'] as String;
  set foodPairing(String value) => attributes['food_pairing'] = value;
}
