import 'package:flutter/material.dart';

class UiControlsScreen extends StatefulWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  State<UiControlsScreen> createState() => _UiControlsScreenState();
}

class _UiControlsScreenState extends State<UiControlsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine, bike }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('controles iphone'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
                isDeveloper = !isDeveloper;
              })),
      //todos los siguientes radiolist se pueden agrupar creando un nuevo widget
      ExpansionTile(
        title: const Text('Tipo de transportes disponibles'),
        subtitle: Text('$selectedTransportation'),
        children: [
          RadioListTile(
              title: const Text('Automovil'),
              subtitle: const Text('Viajar en carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = Transportation.car;
                  })),
          RadioListTile(
              title: const Text('Barco'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = Transportation.boat;
                  })),
          RadioListTile(
              title: const Text('Avion'),
              subtitle: const Text('Viajar en Avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = Transportation.plane;
                  })),
          RadioListTile(
              title: const Text('Submarino'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = Transportation.submarine;
                  })),
          RadioListTile(
              title: const Text('Bicicleta'),
              subtitle: const Text('Viajar en Bicicleta'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = Transportation.bike;
                  }))
        ],
      ),
      CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wantsLunch,
          onChanged: ((value) => setState(() {
                wantsLunch = !wantsLunch;
              }))),
      CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsBreakfast,
          onChanged: ((value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }))),
      CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: ((value) => setState(() {
                wantsDinner = wantsDinner;
              })))
    ]);
  }
}
