import 'package:flutter_rest_data/flutter_rest_data.dart';

class Ingredient extends JsonApiModel {
  Ingredient(JsonApiDocument doc) : super(doc);
  Ingredient.init(String type) : super.init(type);

  String get name => attributes['name'] as String;
  set name(String value) => attributes['name'] = value;

  String get kind => attributes['kind'] as String;
  set kind(String value) => attributes['kind'] = value;

  String get unit => attributes['unit'] as String;
  set unit(String value) => attributes['unit'] = value;

  String get qty => attributes['qty'] as String;
  set qty(String value) => attributes['qty'] = value;
}
