import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme.provider.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final String titleAppbar;
  const CustomAppbar({
    Key? key,
    required this.titleAppbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppbar),
        actions: [
          IconButton(
            icon:
                Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 89);
}
