import 'package:flutter/material.dart';

class BeerErrorWidget extends StatelessWidget {
  final String errorMessage;

  const BeerErrorWidget({Key key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error),
          const SizedBox(
            width: 8.0,
          ),
          Text(errorMessage),
        ],
      );
}
