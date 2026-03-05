import 'package:flutter/material.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';

class ContactoPage extends StatelessWidget {
  const ContactoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const CommonLayout(child: _ContactoContent()),
      floatingActionButton: const _WhatsAppFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class _ContactoContent extends StatelessWidget {
  const _ContactoContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isDesktop
                      ? Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      size: 10,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'SIEMPRE CERCA',
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: isDesktop ? 48 : 36,
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.titleLarge?.color,
                                    height: 1.1,
                                    fontFamily: 'Roboto',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Contáctanos para cuidar a ',
                                    ),
                                    TextSpan(
                                      text: 'tu\nmejor amigo',
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Nuestro equipo de expertos veterinarios está listo para\natenderte con la mejor tecnología y cariño en cualquiera\nde nuestras instalaciones.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.color,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    size: 10,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'SIEMPRE CERCA',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: isDesktop ? 48 : 36,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.titleLarge?.color,
                                  height: 1.1,
                                  fontFamily: 'Roboto',
                                ),
                                children: [
                                  TextSpan(text: 'Contáctanos para cuidar a '),
                                  TextSpan(
                                    text: 'tu\nmejor amigo',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  TextSpan(text: '.'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Nuestro equipo de expertos veterinarios está listo para\natenderte con la mejor tecnología y cariño en cualquiera\nde nuestras instalaciones.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                  if (isDesktop)
                    const SizedBox(width: 48)
                  else
                    const SizedBox(height: 48),
                  isDesktop
                      ? Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              _InfoCard(
                                icon: Icons.location_on,
                                title: 'Visítanos',
                                desc:
                                    'Av. Las Palmas 1234, Col. Centro.\nCiudad de México.',
                              ),
                              SizedBox(height: 16),
                              _InfoCard(
                                icon: Icons.access_time_filled,
                                title: 'Horario',
                                desc:
                                    'Lun - Vie: 9:00 AM - 7:00 PM\nSábados: 10:00 AM - 2:00 PM',
                              ),
                              SizedBox(height: 24),
                              _MapCard(),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            _InfoCard(
                              icon: Icons.location_on,
                              title: 'Visítanos',
                              desc:
                                  'Av. Las Palmas 1234, Col. Centro.\nCiudad de México.',
                            ),
                            SizedBox(height: 16),
                            _InfoCard(
                              icon: Icons.access_time_filled,
                              title: 'Horario',
                              desc:
                                  'Lun - Vie: 9:00 AM - 7:00 PM\nSábados: 10:00 AM - 2:00 PM',
                            ),
                            SizedBox(height: 24),
                            _MapCard(),
                          ],
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapCard extends StatelessWidget {
  const _MapCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 10),
                  SizedBox(width: 6),
                  Text(
                    'Abierto Ahora',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80&w=600&h=400',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlineHoverButton(
              text: 'Cómo llegar',
              icon: Icons.directions_outlined,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatsAppFab extends StatefulWidget {
  const _WhatsAppFab();

  @override
  State<_WhatsAppFab> createState() => _WhatsAppFabState();
}

class _WhatsAppFabState extends State<_WhatsAppFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          heroTag: null,
          onPressed: () {},
          backgroundColor: const Color(0xFF25D366),
          child: Icon(Icons.call, color: Theme.of(context).cardColor, size: 32),
        ),
      ),
    );
  }
}
