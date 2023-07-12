import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme.provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const name = 'theme_charger_screen';
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aspecto de la app"),
        actions: [
          IconButton(
            icon:
                Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
final int selectecColor = ref.watch(selectecColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {

        final Color color = colors[index];

        return RadioListTile(
          title: Text('Escoge el Color', style: TextStyle(color: color)),
          subtitle: Text('Codigo del color = ${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectecColor,
          onChanged: (value) {
            ref.read(selectecColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
