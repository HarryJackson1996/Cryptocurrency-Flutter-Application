import 'package:cryptocurrency_application/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(builder: (context, theme) {
      return MaterialApp(
        title: 'Material App',
        theme: theme,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: HomeScreen(),
        ),
      );
    });
  }
}
