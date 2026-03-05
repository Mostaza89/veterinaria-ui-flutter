import 'package:flutter/material.dart';
import 'botones.dart';
import '../auth_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Current route to highlight active link
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (currentRoute != '/') Navigator.pushNamed(context, '/');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.pets,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'VetCare',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Navigation Links
          Row(
            children: [
              _NavLink(title: 'Inicio', route: '/', currentRoute: currentRoute),
              const SizedBox(width: 32),
              _NavLink(
                title: 'Servicios',
                route: '/servicios',
                currentRoute: currentRoute,
              ),
              const SizedBox(width: 32),
              _NavLink(
                title: 'Nosotros',
                route: '/nosotros',
                currentRoute: currentRoute,
              ),
              const SizedBox(width: 32),
              _NavLink(
                title: 'Blog',
                route: '/blog',
                currentRoute: currentRoute,
              ),
              const SizedBox(width: 32),
              _NavLink(
                title: 'Contacto',
                route: '/contacto',
                currentRoute: currentRoute,
              ),
            ],
          ),

          Row(
            children: [
              if (currentRoute == '/blog') ...[
                Container(
                  width: 200,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 18, color: Colors.blueGrey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Buscar artículo...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
              ValueListenableBuilder<UserRole?>(
                valueListenable: authProvider,
                builder: (context, userRole, child) {
                  if (userRole != null) {
                    return OutlineHoverButton(
                      text: userRole == UserRole.admin
                          ? 'Panel Admin'
                          : 'Mi Perfil',
                      icon: Icons.person,
                      onPressed: () {
                        Navigator.pushNamed(context, '/perfil');
                      },
                    );
                  }
                  return OutlineHoverButton(
                    text: 'Iniciar Sesión',
                    icon: Icons.login,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              // Agendar Cita Button
              JellyButton(
                text: 'Agendar Cita',
                icon: Icons.calendar_today,
                baseColor: Theme.of(context).colorScheme.tertiary,
                onPressed: () {
                  Navigator.pushNamed(context, '/contacto');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final String route;
  final String currentRoute;

  const _NavLink({
    required this.title,
    required this.route,
    required this.currentRoute,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.currentRoute == widget.route;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (!isActive) Navigator.pushNamed(context, widget.route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: (isActive || _isHovering)
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: (isActive || _isHovering)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
      ),
    );
  }
}
