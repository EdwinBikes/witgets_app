import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // hace que al volver a oprimir el boton el snackbar se cierre

    final snackBar = SnackBar(
      content: const Text('soy un Snackbar'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            false, //obliga a que tiene que escoger alguna de las dos opciones del alert para poder continuar
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text(
                  'Estoy haciendo pruebas y aca varia el tamaño del widget padre dependiendo el widget hijo. si el texto es muy grande el se ajusta automaticamente'),
              actions: [
                TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
                FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogos y snackbars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      children: [const Text('estamos haciendo pruebas')]);
                },
                child: const Text('Licencias usadas')),
            const SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Licencias usadas'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('dsfsd'),
        icon: const Icon(Icons.icecream_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
