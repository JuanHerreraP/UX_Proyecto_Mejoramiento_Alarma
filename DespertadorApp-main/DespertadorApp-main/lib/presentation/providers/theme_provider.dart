import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  bool build() {
    return false;
  }

  void setLightTheme() => state = false;
  void setDarkTheme() => state = true;
}
