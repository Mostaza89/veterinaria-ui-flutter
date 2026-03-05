import 'package:flutter/material.dart';
import 'theme_provider.dart';

import 'screens/inicio_page.dart';
import 'screens/nosotros_page.dart';
import 'screens/servicios_page.dart';
import 'screens/blog_page.dart';
import 'screens/contacto_page.dart';
import 'screens/login_page.dart';
import 'screens/perfil_page.dart';

// Definición de nueva paleta de colores - Estilo "Soft Clinical"
const Color vetPrimaryGreen = Color(0xFF14B8A6); // Teal suave y clínico
const Color vetPrimaryBlue = Color(0xFF38BDF8); // Azul cielo fresco
const Color vetAccentOrange = Color(
  0xFFFBBF24,
); // Ámbar cálido (Botones/Acción)
const Color vetBackground = Color(0xFFF0FDF4); // Fondo blanco-menta muy claro
const Color vetTextDark = Color(0xFF475569); // Texto gris pizarra suave

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
            final fadeAnim = CurveTween(
              curve: Curves.easeInOut,
            ).animate(animation);
            final slideAnim =
                Tween<Offset>(
                  begin: const Offset(0.0, 0.05),
                  end: Offset.zero,
                ).animate(
                  CurveTween(curve: Curves.easeOutCubic).animate(animation),
                );

            return SlideTransition(
              position: slideAnim,
              child: FadeTransition(opacity: fadeAnim, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}
