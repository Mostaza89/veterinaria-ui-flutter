import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: 40,
      ),
      child: Column(
        children: [
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColumn1(context),
                const SizedBox(height: 32),
                _buildColumn2(context),
                const SizedBox(height: 32),
                _buildColumn3(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: _buildColumn1(context)),
                Expanded(flex: 1, child: _buildColumn2(context)),
                Expanded(flex: 2, child: _buildColumn3(context)),
              ],
            ),
          const SizedBox(height: 40),
          Divider(color: Theme.of(context).dividerColor, height: 1),
          const SizedBox(height: 24),
          if (isMobile)
            Column(
              children: [
                _buildSocial(context),
                const SizedBox(height: 16),
                _buildCopyright(context),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildCopyright(context), _buildSocial(context)],
            ),
        ],
      ),
    );
  }

  Widget _buildColumn1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
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
    );
  }

  Widget _buildColumn2(BuildContext context) {
    return Column(
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
    );
  }

  Widget _buildColumn3(BuildContext context) {
    return Column(
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
        _ContactRow(Icons.location_on_outlined, 'Calle Principal 123, Ciudad'),
        const SizedBox(height: 8),
        _ContactRow(Icons.phone_outlined, '555-0123'),
        const SizedBox(height: 8),
        _ContactRow(Icons.email_outlined, 'info@vetcare.com'),
      ],
    );
  }

  Widget _buildCopyright(BuildContext context) {
    return Text(
      '© 2023 VetCare Clínica Veterinaria. Todos los derechos reservados.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodySmall?.color,
        fontSize: 12,
      ),
    );
  }

  Widget _buildSocial(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.facebook,
          color: Theme.of(context).textTheme.bodySmall?.color,
          size: 20,
        ),
        const SizedBox(width: 16),
        Icon(
          Icons.camera_alt_outlined,
          color: Theme.of(context).textTheme.bodySmall?.color,
          size: 20,
        ),
      ],
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
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
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
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
