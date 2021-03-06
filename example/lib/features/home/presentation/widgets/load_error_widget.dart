import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/beer_error_widget.dart';
import '../../bloc/beers_state.dart';
import '../../bloc/home.dart';

class LoadErrorWidget extends StatelessWidget {
  final LoadError error;

  const LoadErrorWidget({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            BeerErrorWidget(
              errorMessage: error.beerError.map(
                unexpected: (e) => 'Unexpected: ${e.error}',
                missingNetwork: (_) => 'Network Connection is missing',
                insufficientPermissions: (_) =>
                    'Check Network Permissions, Please',
              ),
            ),
            RaisedButton(
              onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                const HomeEvent.load(),
              ),
              child: const Text('Retry'),
            )
          ],
        ),
      );
}
