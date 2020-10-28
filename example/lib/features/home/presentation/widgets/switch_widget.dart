import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final String title;
  final bool content;
  final ValueChanged<bool> onChanged;

  const SwitchWidget({
    Key key,
    this.title,
    this.content,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Switch(
            activeColor: Theme.of(context).accentColor,
            activeTrackColor: Theme.of(context).accentColor.withOpacity(0.15),
            value: content ?? false,
            onChanged: onChanged,
          ),
        ],
      );
}
