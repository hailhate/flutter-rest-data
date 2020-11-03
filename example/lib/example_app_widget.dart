import 'package:flutter/material.dart';

import 'features/home/presentation/home_page.dart';

class ExampleAppWidget extends StatelessWidget {
  const ExampleAppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beers API Client',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: const Color(0xFF272d2F),
            displayColor: const Color(0xFF272d2F),
          )),
      home: const HomePage(),
    );
  }
}
