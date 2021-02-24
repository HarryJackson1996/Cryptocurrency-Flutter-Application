import 'package:cryptocurrency_application/blocs/theme/theme_bloc.dart';
import 'package:cryptocurrency_application/repositories/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'models/theme_key.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeKeyAdapter());
  await Hive.openBox<ThemeKey>(ThemeRepository.themeKey);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(
            repository: ThemeRepository(
              themeBox: Hive.box<ThemeKey>(ThemeRepository.themeKey),
            ),
          )..add(ThemeFetched()),
        )
      ],
      child: App(),
    ),
  );
}
