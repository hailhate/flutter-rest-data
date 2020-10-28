import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home.dart';

class LoadBeersButton extends StatelessWidget {
  const LoadBeersButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: () => BlocProvider.of<HomeBloc>(context).add(
          const HomeEvent.load(),
        ),
        child: const Text('Load Beers'),
      );
}
