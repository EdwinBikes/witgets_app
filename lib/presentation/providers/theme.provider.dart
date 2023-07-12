import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// listado de colores inmutables de la aplicación
final colorListProvider = Provider((ref) => colorList);

final isDarkmodeProvider = StateProvider((ref) => true);

final selectecColorProvider = StateProvider((ref) => 5);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// class themeController extends StateNotifier { ----- se recomienda el nombre de la clase segun el tipo de dato que va a manejar
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
