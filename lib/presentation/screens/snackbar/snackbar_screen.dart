import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

void showCustomSnackbar(BuildContext context){
  ScaffoldMessenger.of(context).clearSnackBars();// hace que al volver a oprimir el boton el snackbar se cierre 

  final snackBar = SnackBar(content: const Text('soy un Snackbar'),
  action: SnackBarAction(label: 'ok', onPressed: (){}),
  duration: const Duration(seconds: 2),);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogos y snackbars')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('dsfsd'),
        
        icon: const Icon(Icons.icecream_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
