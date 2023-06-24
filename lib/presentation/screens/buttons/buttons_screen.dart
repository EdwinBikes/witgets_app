import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('prueba de pantalla')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Botton')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Botton')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc_sharp),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm),
                label: const Text('Filled icon')),
            const OutlinedButton(onPressed: null, child: Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessible_forward_sharp),
              label: const Text('Outline Icon'),
            ),
            const TextButton(onPressed: null, child: Text('Text button')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.safety_check),
              label: const Text('Text button icon'),
            ),
           const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_task_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_task_outlined),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
          color: colors.primary,
          child: InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'sdasd',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          )),
    );
  }
}
