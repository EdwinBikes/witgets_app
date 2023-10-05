import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Counter Screen',
      subTitle: 'Contador',
      link: '/counter',
      icon: Icons.star_border),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Controladores Generales',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars and dialogos',
      subTitle: 'Indicadodes en pantallas',
      link: '/snackbars',
      icon: Icons.alarm_on_sharp),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Widgets Animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'Controls UI',
      subTitle: 'Controles de UI',
      link: '/controlsUI',
      icon: Icons.camera_alt_sharp),
  MenuItem(
      title: 'Turorial de la APP',
      subTitle: 'Turotial App',
      link: '/tutorial',
      icon: Icons.car_rental),
  MenuItem(
      title: 'Scroll infinito',
      subTitle: 'Ver imagenes sin fin',
      link: '/scroll',
      icon: Icons.vibration_sharp),
  MenuItem(
      title: 'letras a numeros',
      subTitle: 'Puedes cambiar palabras según su posición en el abecedario',
      link: '/leter_num_screen',
      icon: Icons.color_lens_sharp),
  MenuItem(
      title: 'web',
      subTitle: 'P',
      link: '/page_view_screen',
      icon: Icons.color_lens_sharp),
];
