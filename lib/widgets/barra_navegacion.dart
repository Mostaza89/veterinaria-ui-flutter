import 'package:flutter/material.dart';
import 'botones.dart';
import '../auth_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Current route to highlight active link
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 16,
      ),
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

          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )
          else ...[
            // Navigation Links
            Row(
              children: [
                _NavLink(
                  title: 'Inicio',
                  route: '/',
                  currentRoute: currentRoute,
                ),
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
        ],
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Icon(
                    Icons.pets,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'VetCare',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Theme.of(context).dividerColor),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  _DrawerLink(
                    title: 'Inicio',
                    route: '/',
                    currentRoute: currentRoute,
                    icon: Icons.home_outlined,
                  ),
                  _DrawerLink(
                    title: 'Servicios',
                    route: '/servicios',
                    currentRoute: currentRoute,
                    icon: Icons.medical_services_outlined,
                  ),
                  _DrawerLink(
                    title: 'Nosotros',
                    route: '/nosotros',
                    currentRoute: currentRoute,
                    icon: Icons.groups_outlined,
                  ),
                  _DrawerLink(
                    title: 'Blog',
                    route: '/blog',
                    currentRoute: currentRoute,
                    icon: Icons.newspaper_outlined,
                  ),
                  _DrawerLink(
                    title: 'Contacto',
                    route: '/contacto',
                    currentRoute: currentRoute,
                    icon: Icons.call_outlined,
                  ),
                ],
              ),
            ),
            Divider(color: Theme.of(context).dividerColor),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/perfil');
                          },
                        );
                      }
                      return OutlineHoverButton(
                        text: 'Iniciar Sesión',
                        icon: Icons.login,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/login');
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  JellyButton(
                    text: 'Agendar Cita',
                    icon: Icons.calendar_today,
                    baseColor: Theme.of(context).colorScheme.tertiary,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/contacto');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  final String title;
  final String route;
  final String currentRoute;
  final IconData icon;

  const _DrawerLink({
    required this.title,
    required this.route,
    required this.currentRoute,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentRoute == route;
    return ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (!isActive) Navigator.pushNamed(context, route);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: isActive
          ? Theme.of(
              context,
            ).colorScheme.primaryContainer.withValues(alpha: 0.5)
          : null,
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
