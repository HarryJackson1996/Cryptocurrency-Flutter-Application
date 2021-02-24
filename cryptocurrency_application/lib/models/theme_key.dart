import 'package:hive/hive.dart';
part 'theme_key.g.dart';

@HiveType(typeId: 0)
enum ThemeKey {
  @HiveField(0)
  LIGHT,

  @HiveField(1)
  DARK,
}
