import 'package:flutter/material.dart';

import 'screens/inicio_page.dart';
import 'screens/nosotros_page.dart';
import 'screens/servicios_page.dart';
import 'screens/blog_page.dart';
import 'screens/contacto_page.dart';

void main() {
  runApp(const VetCareApp());
}

class VetCareApp extends StatelessWidget {
  const VetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCare Mockup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:
            'Roboto', // Default fallback, visually close to sans-serif mockup
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF29B6F6)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPage(),
        '/servicios': (context) => const ServiciosPage(),
        '/nosotros': (context) => const NosotrosPage(),
        '/blog': (context) => const BlogPage(),
        '/contacto': (context) => const ContactoPage(),
      },
    );
  }
}
