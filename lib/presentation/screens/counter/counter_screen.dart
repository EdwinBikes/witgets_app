import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme.provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
        appBar: AppBar(
          title: const Text("customScreen"),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode_outlined),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier)
                    .toogleDarkMode();
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            "Cantidad de fotos $clickCounter",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_a_photo),
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
            //ref.read(counterProvider.notifier).update((state) => state+1);
          },
        ));
  }
}
