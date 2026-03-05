import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      child: Column(
        children: [
          _HeroSection(),
          _HistoriaSection(),
          _EquipoSection(),
          _InstalacionesSection(),
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
        return Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Container(
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
                      color: Theme.of(context).colorScheme.secondary,
                      size: 10,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'SOBRE NOSOTROS',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: isMobile ? 40 : 56,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                    height: 1.1,
                    fontFamily: 'Roboto',
                  ),
                  children: [
                    TextSpan(text: 'Cuidando familias,\n'),
                    TextSpan(text: 'una huella a la '),
                    TextSpan(
                      text: 'vez.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 600,
                child: Text(
                  'Dedicados a la salud y bienestar de tus mascotas desde 2010. Creemos en\nuna medicina veterinaria que combina la tecnología moderna con un\ncorazón cálido.',
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.6,
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

class _HistoriaSection extends StatelessWidget {
  const _HistoriaSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.history_edu,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Nuestra Historia',
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 32,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).textTheme.titleLarge?.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Comenzamos como un pequeño consultorio con un gran sueño: brindar\nla mejor atención veterinaria con un enfoque humano y compasivo.\n\nA lo largo de los años, hemos crecido junto con nuestra comunidad,\nincorporando tecnología de vanguardia sin perder la calidez que nos\ncaracteriza. Hoy somos un referente en medicina preventiva y cirugía\navanzada, pero nuestra esencia sigue siendo la misma: tratar a cada\nmascota como si fuera nuestra.',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children:
                          [
                                Column(
                                  crossAxisAlignment: isMobile
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '14+',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    Text(
                                      'AÑOS DE EXPERIENCIA',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 48),
                                Column(
                                  crossAxisAlignment: isMobile
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '5k+',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    Text(
                                      'MASCOTAS FELICES',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                              .animate(interval: 150.ms)
                              .fade(duration: 600.ms)
                              .slideY(
                                begin: 0.1,
                                duration: 600.ms,
                                curve: Curves.easeOutCubic,
                              ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: isMobile ? 0 : 48, height: isMobile ? 48 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:
                      Image.network(
                            'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80&w=800&h=600',
                            fit: BoxFit.cover,
                            height: isMobile ? 300 : 400,
                            width: double.infinity,
                          )
                          .animate()
                          .fade(duration: 800.ms)
                          .scale(
                            begin: const Offset(0.95, 0.95),
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

class _EquipoSection extends StatelessWidget {
  const _EquipoSection();

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
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Text(
                'Conoce al Equipo',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Profesionales apasionados comprometidos con la excelencia médica y el trato\namoroso.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              const SizedBox(height: 64),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 32,
                runSpacing: 48,
                children:
                    [
                          _DoctorProfile(
                            name: 'Dra. Ana Martínez',
                            spec: 'Cirugía General',
                            exp: '10 años exp',
                          ),
                          _DoctorProfile(
                            name: 'Dr. Carlos Ruiz',
                            spec: 'Medicina Interna',
                            exp: '8 años exp',
                          ),
                          _DoctorProfile(
                            name: 'Dra. Sofía López',
                            spec: 'Dermatología',
                            exp: '5 años exp',
                          ),
                          _DoctorProfile(
                            name: 'Dr. Miguel Torres',
                            spec: 'Odontología',
                            exp: '12 años exp',
                          ),
                        ]
                        .animate(interval: 100.ms)
                        .fade(duration: 600.ms)
                        .scale(
                          begin: const Offset(0.9, 0.9),
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

class _DoctorProfile extends StatelessWidget {
  final String name;
  final String spec;
  final String exp;

  const _DoctorProfile({
    required this.name,
    required this.spec,
    required this.exp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              width: 4,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?auto=format&fit=crop&q=80&w=300&h=300',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          spec,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            exp,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
        ),
      ],
    );
  }
}

class _InstalacionesSection extends StatelessWidget {
  const _InstalacionesSection();

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
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nuestras Instalaciones',
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 32,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).textTheme.titleLarge?.color,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Espacios diseñados para la comodidad y seguridad de tus pacientes.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile)
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Icon(Icons.arrow_back, size: 20),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Icon(Icons.arrow_forward, size: 20),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 40),
              if (isMobile)
                Column(
                  children:
                      [
                            _FacilityCard(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=600&h=400',
                              title: 'Sala de Espera',
                              desc: 'Ambiente libre de estrés',
                            ),
                            const SizedBox(height: 24),
                            _FacilityCard(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&q=80&w=600&h=400',
                              title: 'Quirófano',
                              desc: 'Tecnología de monitoreo 24/7',
                            ),
                            const SizedBox(height: 24),
                            _FacilityCard(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=80&w=600&h=400',
                              title: 'Recuperación',
                              desc: 'Espacios individuales climatizados',
                            ),
                          ]
                          .animate(interval: 150.ms)
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
                              child: _FacilityCard(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=600&h=400',
                                title: 'Sala de Espera',
                                desc: 'Ambiente libre de estrés',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _FacilityCard(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&q=80&w=600&h=400',
                                title: 'Quirófano',
                                desc: 'Tecnología de monitoreo 24/7',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _FacilityCard(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=80&w=600&h=400',
                                title: 'Recuperación',
                                desc: 'Espacios individuales climatizados',
                              ),
                            ),
                          ]
                          .animate(interval: 150.ms)
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

class _FacilityCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  const _FacilityCard({
    required this.imageUrl,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          desc,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ],
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
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 64,
            horizontal: isMobile ? 24 : 24,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '¿Listo para visitarnos?',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Agenda tu cita hoy y forma parte de la familia VetCare.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isMobile ? double.infinity : null,
                    child: JellyButton(
                      text: 'Agendar Cita',
                      onPressed: () {
                        Navigator.pushNamed(context, '/contacto');
                      },
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : 16, height: isMobile ? 16 : 0),
                  SizedBox(
                    width: isMobile ? double.infinity : null,
                    child: OutlineHoverButton(
                      text: 'Contáctanos',
                      onPressed: () {
                        Navigator.pushNamed(context, '/contacto');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
