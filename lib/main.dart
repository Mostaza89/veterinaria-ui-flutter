import 'package:flutter/material.dart';
import 'theme_provider.dart';

import 'screens/inicio_page.dart';
import 'screens/nosotros_page.dart';
import 'screens/servicios_page.dart';
import 'screens/blog_page.dart';
import 'screens/contacto_page.dart';
import 'screens/login_page.dart';
import 'screens/perfil_page.dart';

// Definición de nueva paleta de colores
const Color vetPrimaryGreen = Color(0xFF10B981); // Verde salud
const Color vetPrimaryBlue = Color(0xFF0EA5E9); // Azul clínico
const Color vetAccentOrange = Color(0xFFF97316); // Botón de acción (Citas)
const Color vetBackground = Color(0xFFF8FAFC); // Fondo blanco-grisáceo
const Color vetTextDark = Color(0xFF334155); // Texto legible

void main() {
  runApp(const AppStateContainer());
}

class AppStateContainer extends StatelessWidget {
  const AppStateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeProvider,
      builder: (context, themeMode, _) {
        return VetCareApp(themeMode: themeMode);
      },
    );
  }
}

class VetCareApp extends StatelessWidget {
  final ThemeMode themeMode;
  const VetCareApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCare Mockup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: vetBackground,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: vetTextDark),
          bodyMedium: TextStyle(color: vetTextDark),
          titleLarge: TextStyle(color: vetTextDark),
          titleMedium: TextStyle(color: vetTextDark),
        ),
        colorScheme: const ColorScheme.light(
          primary: vetPrimaryGreen,
          onPrimary: Colors.white,
          secondary: vetPrimaryBlue,
          onSecondary: Colors.white,
          tertiary: vetAccentOrange,
          onTertiary: Colors.white,
          surface: Colors.white,
          onSurface: vetTextDark,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: vetPrimaryGreen,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      themeAnimationDuration: const Duration(milliseconds: 600),
      themeAnimationCurve: Curves.easeInOut,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/':
            page = const InicioPage();
            break;
          case '/servicios':
            page = const ServiciosPage();
            break;
          case '/nosotros':
            page = const NosotrosPage();
            break;
          case '/blog':
            page = const BlogPage();
            break;
          case '/contacto':
            page = const ContactoPage();
            break;
          case '/login':
            page = const LoginPage();
            break;
          case '/perfil':
            page = const PerfilPage();
            break;
          default:
            page = const InicioPage();
        }

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}
