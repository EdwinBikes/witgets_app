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
      link: '/tutotial',
      icon: Icons.car_rental),
];
