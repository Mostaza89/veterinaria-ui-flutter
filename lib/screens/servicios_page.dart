import 'dart:ui';
import 'package:flutter/material.dart';
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
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(40),
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
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 64),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: 450,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF4FC3F7),
                            size: 10,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'SERVICIOS INTEGRALES',
                            style: TextStyle(
                              color: Colors.white,
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
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          fontFamily: 'Roboto',
                        ),
                        children: [
                          TextSpan(text: 'Cuidamos a quienes\n'),
                          TextSpan(
                            text: 'más amas',
                            style: TextStyle(color: Color(0xFF29B6F6)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Tecnología de vanguardia y amor incondicional en cada consulta. Descubre nuestra gama completa de cuidados especializados.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiciosGridSection extends StatelessWidget {
  const _ServiciosGridSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Colors.white,
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
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Soluciones veterinarias modernas para cada etapa de vida.',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.grid_view,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.view_list,
                      size: 20,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            childAspectRatio: 0.65,
            children: const [
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
                features: ['Anestesia inhalatoria', 'Monitoreo constante'],
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
              _EmergencyCard(),
            ],
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFEEEEEE), width: 1.5),
          boxShadow: _isHovering
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
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
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_outline,
                      size: 18,
                      color: Color(0xFF29B6F6),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -24,
                  left: 24,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(
                      widget.icon,
                      color: const Color(0xFF29B6F6),
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
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blueGrey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...widget.features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF4CAF50),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: TextStyle(
                                  color: Colors.blueGrey[700],
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
        gradient: const LinearGradient(
          colors: [Color(0xFFE1F5FE), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emergency,
              color: Color(0xFF29B6F6),
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '¿Emergencia?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
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
                color: Colors.blueGrey[600],
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
    return Container(
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tecnología Diagnóstica de Punta',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Nuestras instalaciones cuentan con laboratorio clínico propio, rayos X digitales y ecografía Doppler para obtener resultados precisos y rápidos.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    _IconDetail(
                      icon: Icons.science,
                      color: Colors.blue,
                      label: 'Laboratorio',
                    ),
                    const SizedBox(width: 24),
                    _IconDetail(
                      icon: Icons.medical_information,
                      color: Colors.green,
                      label: 'Rayos X',
                    ),
                    const SizedBox(width: 24),
                    _IconDetail(
                      icon: Icons.waves,
                      color: Colors.purple,
                      label: 'Ecografía',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                'https://images.unsplash.com/photo-1581093450021-4a7360e9a6b5?auto=format&fit=crop&q=80&w=800&h=400',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
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
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    );
  }
}
