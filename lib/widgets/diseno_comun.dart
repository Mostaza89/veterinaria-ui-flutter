import 'package:flutter/material.dart';
import 'encabezado_superior.dart';
import 'barra_navegacion.dart';
import 'pie_de_pagina.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;

  const CommonLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopHeader(),
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [child, const Footer()]),
            ),
          ),
        ],
      ),
    );
  }
}
