import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column 1: Logo & Description
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [ Icon(
                          Icons.pets,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'VetCare',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).textTheme.titleLarge?.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Dedicados a la salud y bienestar de tus\nmascotas con amor y profesionalismo desde\n2010.',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Column 2: Enlaces
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enlaces',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _FooterLink('Inicio', '/'),
                    _FooterLink('Servicios', '/servicios'),
                    _FooterLink('Nosotros', '/nosotros'),
                    _FooterLink('Contacto', '/contacto'),
                  ],
                ),
              ),

              // Column 3: Contacto
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contacto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _ContactRow(
                      Icons.location_on_outlined,
                      'Calle Principal 123, Ciudad',
                    ),
                    const SizedBox(height: 8),
                    _ContactRow(Icons.phone_outlined, '555-0123'),
                    const SizedBox(height: 8),
                    _ContactRow(Icons.email_outlined, 'info@vetcare.com'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Theme.of(context).dividerColor, height: 1),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2023 VetCare Clínica Veterinaria. Todos los derechos reservados.',
                style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 12),
              ),
              Row(
                children: [
                  Icon(Icons.facebook, color: Theme.of(context).textTheme.bodySmall?.color, size: 20),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final String route;

  const _FooterLink(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            final String currentRoute =
                ModalRoute.of(context)?.settings.name ?? '/';
            if (currentRoute != route) Navigator.pushNamed(context, route);
          },
          child: Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).textTheme.bodySmall?.color),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontSize: 13)),
      ],
    );
  }
}
