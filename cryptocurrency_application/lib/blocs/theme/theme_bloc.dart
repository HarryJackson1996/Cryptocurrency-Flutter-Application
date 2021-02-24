import 'dart:async';
import 'package:cryptocurrency_application/models/theme_key.dart';
import 'package:cryptocurrency_application/repositories/theme_repository.dart';
import 'package:cryptocurrency_application/themes/themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final ThemeRepository repository;

  ThemeBloc({this.repository})
      : assert(repository != null),
        super(lightTheme);

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeFetched) {
      yield repository.loadTheme();
    }
    if (event is ThemeUpdated) {
      yield* _mapThemeUpdatedToState(event);
    }
  }

  Stream<ThemeData> _mapThemeUpdatedToState(ThemeUpdated event) async* {
    await repository.setTheme(event.themeKey);
    yield repository.loadTheme();
  }
}
