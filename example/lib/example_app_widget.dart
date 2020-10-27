import 'package:flutter/material.dart';

class ExampleAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beers API Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Beers API Client'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center),
      ),
    );
  }
}
