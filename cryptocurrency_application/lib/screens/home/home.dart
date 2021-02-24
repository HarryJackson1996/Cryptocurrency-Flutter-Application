import 'package:cryptocurrency_application/blocs/theme/theme_bloc.dart';
import 'package:cryptocurrency_application/models/theme_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text('Light'),
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeUpdated(themeKey: ThemeKey.LIGHT));
            },
          ),
          RaisedButton(
            child: Text('Dark'),
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeUpdated(themeKey: ThemeKey.DARK));
            },
          ),
        ],
      ),
    );
  }
}
