import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => true);

// listado de colores inmutables de la aplicación
final colorListProvider = StateProvider((ref) => colorList);

final selectecColorProvider = StateProvider((ref) => 2);
