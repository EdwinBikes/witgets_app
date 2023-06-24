import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutter')),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        // return ListTile(title: Text(appMenuItems[0].title),); ………este fue el resultado de la tarea que dejo fernando en el curso
        // final menuItem = appMenuItems[index];  …………… esto fue lo que el sugirio pero le falta el listtitle
        // return Text(menuItem.title);
        // resumen: me habia faltado crear una variable para implementar el appMenuItems para saber el index
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_back_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
        context.pushNamed(CardsScreen.name);
      },
    );
  }
}
