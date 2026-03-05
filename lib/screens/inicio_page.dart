import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      child: Column(
        children: [
          _HeroSection(),
          _ServiciosSection(),
          _PlanesSection(),
          _TestimoniosSection(),
          _BottomCtaSection(),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        final double paddingHorizontal = isMobile ? 24.0 : 40.0;
        final double paddingVertical = isMobile ? 40.0 : 30.0;

        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          child: isMobile
              ? Column(
                  children: [
                    _buildTextColumn(context, isMobile: true),
                    const SizedBox(height: 48),
                    _buildImageColumn(context, isMobile: true),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildTextColumn(context, isMobile: false),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildImageColumn(context, isMobile: false),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextColumn(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children:
          [
                Transform.translate(
                  offset: const Offset(-4, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Theme.of(context).colorScheme.primary,
                          size: 10,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'ABIERTO AHORA',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: isMobile ? 40 : 56,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      height: 1.1,
                      fontFamily: 'Roboto',
                    ),
                    children: [
                      TextSpan(text: 'Cuidamos a tu\n'),
                      TextSpan(
                        text: 'mejor amigo',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Atención veterinaria integral con tecnología\nmoderna y el cariño de siempre. Tu mascota\nmerece lo mejor.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    JellyButton(
                      text: 'Agendar Cita',
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        Navigator.pushNamed(context, '/contacto');
                      },
                    ),
                    const SizedBox(width: 16),
                    OutlineHoverButton(
                      text: 'Llamar',
                      icon: Icons.phone_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
              ]
              .animate(interval: 100.ms)
              .fade(duration: 600.ms)
              .slideY(begin: 0.05, duration: 600.ms),
    );
  }

  Widget _buildImageColumn(BuildContext context, {required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 0 : 80.0,
        vertical: isMobile ? 0 : 40.0,
      ),
      child:
          ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/images/dog.jpeg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  height: isMobile ? 250 : 350,
                  width: double.infinity,
                ),
              )
              .animate()
              .fade(duration: 800.ms)
              .scale(
                begin: const Offset(0.95, 0.95),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),
    );
  }
}

class _ServiciosSection extends StatelessWidget {
  const _ServiciosSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
          color: Theme.of(context).colorScheme.surface,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Nuestros Servicios',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Todo lo que tu mascota necesita en un solo lugar, con equipos de última generación.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  children:
                      [
                            _ServiceCard(
                              icon: Icons.medical_services_outlined,
                              title: 'Medicina General',
                              desc:
                                  'Consultas diarias, diagnóstico preciso y chequeos preventivos integrales.',
                            ),
                            const SizedBox(height: 24),
                            _ServiceCard(
                              icon: Icons.medication_liquid_outlined,
                              title: 'Cirugía Avanzada',
                              desc:
                                  'Quirófano equipado con tecnología de punta y monitoreo constante.',
                            ),
                            const SizedBox(height: 24),
                            _ServiceCard(
                              icon: Icons.vaccines_outlined,
                              title: 'Vacunación',
                              desc:
                                  'Protocolos completos de inmunización para todas las etapas de vida.',
                            ),
                            const SizedBox(height: 24),
                            _ServiceCard(
                              icon: Icons.content_cut_outlined,
                              title: 'Estética Canina',
                              desc:
                                  'Baños medicados, cortes de raza y limpieza dental profunda.',
                            ),
                          ]
                          .animate(interval: 100.ms)
                          .fade(duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            duration: 600.ms,
                            curve: Curves.easeOutCubic,
                          ),
                )
              else
                Row(
                  children:
                      [
                            Expanded(
                              child: _ServiceCard(
                                icon: Icons.medical_services_outlined,
                                title: 'Medicina General',
                                desc:
                                    'Consultas diarias, diagnóstico preciso y chequeos preventivos integrales.',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _ServiceCard(
                                icon: Icons.medication_liquid_outlined,
                                title: 'Cirugía Avanzada',
                                desc:
                                    'Quirófano equipado con tecnología de punta y monitoreo constante.',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _ServiceCard(
                                icon: Icons.vaccines_outlined,
                                title: 'Vacunación',
                                desc:
                                    'Protocolos completos de inmunización para todas las etapas de vida.',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _ServiceCard(
                                icon: Icons.content_cut_outlined,
                                title: 'Estética Canina',
                                desc:
                                    'Baños medicados, cortes de raza y limpieza dental profunda.',
                              ),
                            ),
                          ]
                          .animate(interval: 100.ms)
                          .fade(duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            duration: 600.ms,
                            curve: Curves.easeOutCubic,
                          ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(32),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.desc,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanesSection extends StatelessWidget {
  const _PlanesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            'Planes de Salud Preventiva',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Elige la mejor cobertura para la tranquilidad de tu familia.',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children:
                [
                      _PricingCard(
                        title: 'Plan Cachorro',
                        price: '\$500',
                        features: [
                          'Vacunas iniciales',
                          'Desparasitación mensual',
                          '1 Consulta gratis',
                        ],
                      ),
                      _PricingCard(
                        title: 'Plan Adulto',
                        price: '\$450',
                        features: [
                          'Vacunas anuales completas',
                          'Limpieza dental ultrasónico',
                          '2 Consultas gratis',
                          'Descuento en alimentos',
                        ],
                        isPopular: true,
                      ),
                      _PricingCard(
                        title: 'Plan Senior',
                        price: '\$600',
                        features: [
                          'Geriatría especializada',
                          'Análisis de sangre completo',
                          '3 Consultas gratis',
                        ],
                      ),
                    ]
                    .animate(interval: 150.ms)
                    .fade(duration: 600.ms)
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      duration: 600.ms,
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ],
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isPopular;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.features,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
        border: isPopular
            ? Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.tertiary.withValues(alpha: 0.5),
                width: 2,
              )
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: isPopular
                ? Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.15)
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: isPopular ? 40 : 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'MÁS POPULAR',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              Text(
                ' /año MXN',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      f,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: isPopular
                ? JellyButton(text: 'Elegir Plan', onPressed: () {})
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).hoverColor,
                      foregroundColor: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.color,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Ver detalles',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _TestimoniosSection extends StatelessWidget {
  const _TestimoniosSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              Text(
                'Lo que dicen nuestros clientes',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  children:
                      [
                            _TestimonialCard(
                              name: 'María González',
                              pet: 'Dueña de "Max"',
                              text:
                                  'La mejor atención que ha recibido mi perro. El equipo es increíblemente amable y profesional. ¡Gracias por todo!',
                            ),
                            const SizedBox(height: 24),
                            _TestimonialCard(
                              name: 'Carlos Ruiz',
                              pet: 'Dueño de "Luna"',
                              text:
                                  'Salvaron a mi gatita en una emergencia nocturna. Eternamente agradecido por su rápida respuesta y dedicación.',
                            ),
                            const SizedBox(height: 24),
                            _TestimonialCard(
                              name: 'Ana Torres',
                              pet: 'Dueña de "Rocky"',
                              text:
                                  'Los planes de salud son excelentes. Me ahorro mucho dinero al año y Rocky siempre tiene sus vacunas al día.',
                            ),
                          ]
                          .animate(interval: 100.ms)
                          .fade(duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            duration: 600.ms,
                            curve: Curves.easeOutCubic,
                          ),
                )
              else
                Row(
                  children:
                      [
                            Expanded(
                              child: _TestimonialCard(
                                name: 'María González',
                                pet: 'Dueña de "Max"',
                                text:
                                    'La mejor atención que ha recibido mi perro. El equipo es increíblemente amable y profesional. ¡Gracias por todo!',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _TestimonialCard(
                                name: 'Carlos Ruiz',
                                pet: 'Dueño de "Luna"',
                                text:
                                    'Salvaron a mi gatita en una emergencia nocturna. Eternamente agradecido por su rápida respuesta y dedicación.',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _TestimonialCard(
                                name: 'Ana Torres',
                                pet: 'Dueña de "Rocky"',
                                text:
                                    'Los planes de salud son excelentes. Me ahorro mucho dinero al año y Rocky siempre tiene sus vacunas al día.',
                              ),
                            ),
                          ]
                          .animate(interval: 100.ms)
                          .fade(duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            duration: 600.ms,
                            curve: Curves.easeOutCubic,
                          ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String name;
  final String pet;
  final String text;

  const _TestimonialCard({
    required this.name,
    required this.pet,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleMedium?.color,
                    ),
                  ),
                  Text(
                    pet,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '"$text"',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.amber, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCtaSection extends StatelessWidget {
  const _BottomCtaSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 48,
            horizontal: isMobile ? 16 : 24,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Text(
                '¿Listo para cuidar a tu mejor amigo?',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Agenda tu cita hoy mismo y recibe un 10% de descuento en tu\nprimera consulta.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contacto');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Reservar Cita Ahora',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
