import 'package:flutter/material.dart';

class LoadInProgressWidget extends StatelessWidget {
  const LoadInProgressWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
