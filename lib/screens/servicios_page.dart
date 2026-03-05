import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      child: Column(
        children: [
          _HeroGlassSection(),
          _ServiciosGridSection(),
          _DiagnosticoSection(),
        ],
      ),
    );
  }
}

class _HeroGlassSection extends StatelessWidget {
  const _HeroGlassSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          width: double.infinity,
          height: isMobile ? 500 : 400,
          margin: EdgeInsets.all(isMobile ? 20 : 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1576201836106-db1758fd1c97?auto=format&fit=crop&q=80&w=1200&h=600',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: isMobile ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 0 : 64,
                right: isMobile ? 0 : 0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: isMobile ? constraints.maxWidth * 0.8 : 450,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).cardColor.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children:
                          [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.3),
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
                                      SizedBox(width: 8),
                                      Text(
                                        'SERVICIOS INTEGRALES',
                                        style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                RichText(
                                  textAlign: isMobile
                                      ? TextAlign.center
                                      : TextAlign.left,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: isMobile ? 32 : 40,
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).cardColor,
                                      height: 1.1,
                                      fontFamily: 'Roboto',
                                    ),
                                    children: [
                                      TextSpan(text: 'Cuidamos a quienes\n'),
                                      TextSpan(
                                        text: 'más amas',
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Tecnología de vanguardia y amor incondicional en cada consulta. Descubre nuestra gama completa de cuidados especializados.',
                                  textAlign: isMobile
                                      ? TextAlign.center
                                      : TextAlign.left,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).cardColor.withValues(alpha: 0.9),
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                              ]
                              .animate(interval: 100.ms)
                              .fade(duration: 600.ms)
                              .slideX(
                                begin: -0.05,
                                duration: 600.ms,
                                curve: Curves.easeOutCubic,
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ServiciosGridSection extends StatelessWidget {
  const _ServiciosGridSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nuestros Servicios',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Soluciones veterinarias modernas para cada etapa de vida.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.grid_view,
                      size: 20,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.view_list,
                      size: 20,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 3;
              if (constraints.maxWidth < 600) {
                crossAxisCount = 1;
              } else if (constraints.maxWidth < 900) {
                crossAxisCount = 2;
              }

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 32,
                crossAxisSpacing: 32,
                childAspectRatio: crossAxisCount == 1 ? 0.8 : 0.65,
                children:
                    [
                          _ServiceDetailCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80&w=600&h=400',
                            icon: Icons.monitor_heart_outlined,
                            title: 'Consulta General',
                            desc:
                                'Evaluación completa de la salud de tu mascota. Diagnóstico preventivo y tratamiento de enfermedades comunes con un enfoque integral.',
                            features: ['Chequeos de rutina', 'Control de peso'],
                            buttonText: 'Agendar Consulta',
                          ),
                          _ServiceDetailCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&q=80&w=600&h=400',
                            icon: Icons.vaccines_outlined,
                            title: 'Vacunación',
                            desc:
                                'Protocolos personalizados para proteger a tu compañero de enfermedades virales y bacterianas. ¡La prevención es clave!',
                            features: ['Calendario anual', 'Desparasitación'],
                            buttonText: 'Ver Calendario',
                          ),
                          _ServiceDetailCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&q=80&w=600&h=400',
                            icon: Icons.cut_outlined,
                            title: 'Cirugía',
                            desc:
                                'Quirófanos equipados con tecnología de monitoreo avanzada. Realizamos desde esterilizaciones hasta cirugías de tejidos blandos.',
                            features: [
                              'Anestesia inhalatoria',
                              'Monitoreo constante',
                            ],
                            buttonText: 'Más Información',
                          ),
                          _ServiceDetailCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=80&w=600&h=400',
                            icon: Icons.clean_hands_outlined,
                            title: 'Odontología',
                            desc:
                                'Limpieza dental profunda por ultrasonido, extracciones y prevención de enfermedad periodontal.',
                            features: ['Profilaxis dental', 'Aliento fresco'],
                            buttonText: 'Reservar Limpieza',
                          ),
                          _ServiceDetailCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&q=80&w=600&h=400',
                            icon: Icons.content_cut_outlined,
                            title: 'Estética y Spa',
                            desc:
                                'Baños medicados, cortes de raza, corte de uñas y limpieza de oídos. Un servicio para que luzcan y se sientan increíbles.',
                            features: [
                              'Productos hipoalergénicos',
                              'Estilistas certificados',
                            ],
                            buttonText: 'Ver Paquetes',
                          ),
                          const _EmergencyCard(),
                        ]
                        .animate(interval: 100.ms)
                        .fade(duration: 600.ms)
                        .scale(
                          begin: const Offset(0.95, 0.95),
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceDetailCard extends StatefulWidget {
  final String imageUrl;
  final IconData icon;
  final String title;
  final String desc;
  final List<String> features;
  final String buttonText;

  const _ServiceDetailCard({
    required this.imageUrl,
    required this.icon,
    required this.title,
    required this.desc,
    required this.features,
    required this.buttonText,
  });

  @override
  State<_ServiceDetailCard> createState() => _ServiceDetailCardState();
}

class _ServiceDetailCardState extends State<_ServiceDetailCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withValues(
                alpha: _isHovering ? 0.15 : 0.05,
              ),
              blurRadius: _isHovering ? 30 : 15,
              offset: _isHovering ? const Offset(0, 15) : const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.bookmark_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -24,
                  left: 24,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.15),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Icon(
                      widget.icon,
                      color: Theme.of(context).colorScheme.primary,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...widget.features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFF4CAF50),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: JellyButton(
                        text: widget.buttonText,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmergencyCard extends StatelessWidget {
  const _EmergencyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.emergency,
              color: Theme.of(context).colorScheme.primary,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '¿Emergencia?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Contamos con servicio de urgencias 24 horas. Tu tranquilidad es nuestra prioridad.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 32),
          JellyButton(
            text: 'Llamar Ahora',
            icon: Icons.phone_in_talk,
            baseColor: const Color(0xFFEF5350), // Red color for emergency
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _DiagnosticoSection extends StatelessWidget {
  const _DiagnosticoSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          margin: EdgeInsets.all(isMobile ? 20 : 40),
          padding: EdgeInsets.all(isMobile ? 24 : 40),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.05),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tecnología Diagnóstica de Punta',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nuestras instalaciones cuentan con laboratorio clínico propio, rayos X digitales y ecografía Doppler para obtener resultados precisos y rápidos.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children:
                          [
                                _IconDetail(
                                  icon: Icons.science,
                                  color: Colors.blue,
                                  label: 'Laboratorio',
                                ),
                                _IconDetail(
                                  icon: Icons.medical_information,
                                  color: Colors.green,
                                  label: 'Rayos X',
                                ),
                                _IconDetail(
                                  icon: Icons.waves,
                                  color: Colors.purple,
                                  label: 'Ecografía',
                                ),
                              ]
                              .animate(interval: 150.ms)
                              .fade(duration: 600.ms)
                              .scale(
                                begin: const Offset(0.8, 0.8),
                                duration: 600.ms,
                                curve: Curves.easeOutBack,
                              ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 32 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child:
                      Image.network(
                            'https://images.unsplash.com/photo-1581093450021-4a7360e9a6b5?auto=format&fit=crop&q=80&w=800&h=400',
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                          .animate()
                          .fade(duration: 800.ms)
                          .slideX(
                            begin: 0.1,
                            duration: 800.ms,
                            curve: Curves.easeOutCubic,
                          ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IconDetail extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _IconDetail({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
      ],
    );
  }
}
