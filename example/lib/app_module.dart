import 'package:flutter_rest_data/flutter_rest_data.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @Named('hostname')
  String get hostname => 'peaceful-hamlet-37069.herokuapp.com';

  @singleton
  PersistentJsonApiAdapter apiAdapter(@Named('hostname') String hostname) {
    final PersistentJsonApiAdapter adapter =
        PersistentJsonApiAdapter(hostname, 'api')..registerAdapters();

    return adapter;
  }
}
