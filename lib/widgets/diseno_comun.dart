import 'package:flutter/material.dart';
import '../theme_provider.dart';
import 'encabezado_superior.dart';
import 'barra_navegacion.dart';
import 'pie_de_pagina.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;

  const CommonLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          themeProvider.toggleTheme();
        },
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeProvider,
          builder: (context, themeMode, _) {
            return Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            );
          },
        ),
      ),
    );
  }
}
