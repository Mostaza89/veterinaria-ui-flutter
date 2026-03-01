import 'package:flutter/material.dart';
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
    return Container(
      width: double.infinity,
      color: const Color(0xFFF1FBFF),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, color: Color(0xFF4FC3F7), size: 10),
                SizedBox(width: 6),
                Text(
                  'SOBRE NOSOTROS',
                  style: TextStyle(
                    color: Color(0xFF0288D1),
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
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey[900],
                height: 1.1,
                fontFamily: 'Roboto',
              ),
              children: const [
                TextSpan(text: 'Cuidando familias,\n'),
                TextSpan(text: 'una huella a la '),
                TextSpan(
                  text: 'vez.',
                  style: TextStyle(color: Color(0xFF29B6F6)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 600,
            child: Text(
              'Dedicados a la salud y bienestar de tus mascotas desde 2010. Creemos en\nuna medicina veterinaria que combina la tecnología moderna con un\ncorazón cálido.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey[600],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoriaSection extends StatelessWidget {
  const _HistoriaSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1F5FE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.history_edu,
                        color: Color(0xFF0288D1),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Nuestra Historia',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Comenzamos como un pequeño consultorio con un gran sueño: brindar\nla mejor atención veterinaria con un enfoque humano y compasivo.\n\nA lo largo de los años, hemos crecido junto con nuestra comunidad,\nincorporando tecnología de vanguardia sin perder la calidez que nos\ncaracteriza. Hoy somos un referente en medicina preventiva y cirugía\navanzada, pero nuestra esencia sigue siendo la misma: tratar a cada\nmascota como si fuera nuestra.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[600],
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '14+',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF29B6F6),
                          ),
                        ),
                        Text(
                          'AÑOS DE EXPERIENCIA',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[400],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 48),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '5k+',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF29B6F6),
                          ),
                        ),
                        Text(
                          'MASCOTAS FELICES',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[400],
                          ),
                        ),
                      ],
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
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80&w=800&h=600',
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EquipoSection extends StatelessWidget {
  const _EquipoSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: const Color(0xFFFAFAFA),
      child: Column(
        children: [
          Text(
            'Conoce al Equipo',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Profesionales apasionados comprometidos con la excelencia médica y el trato\namoroso.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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
            ],
          ),
        ],
      ),
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
            border: Border.all(color: const Color(0xFF4FC3F7), width: 3),
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
            color: Colors.blueGrey[900],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          spec,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF29B6F6),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            exp,
            style: TextStyle(fontSize: 12, color: Colors.blueGrey[600]),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nuestras Instalaciones',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Espacios diseñados para la comodidad y seguridad de tus pacientes.',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: const Icon(Icons.arrow_back, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: const Icon(Icons.arrow_forward, size: 20),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: const [
              Expanded(
                child: _FacilityCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&q=80&w=600&h=400',
                  title: 'Sala de Espera',
                  desc: 'Ambiente libre de estrés',
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: _FacilityCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1516549655169-df83a0774514?auto=format&fit=crop&q=80&w=600&h=400',
                  title: 'Quirófano',
                  desc: 'Tecnología de monitoreo 24/7',
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: _FacilityCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?auto=format&fit=crop&q=80&w=600&h=400',
                  title: 'Recuperación',
                  desc: 'Espacios individuales climatizados',
                ),
              ),
            ],
          ),
        ],
      ),
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
            color: Colors.blueGrey[900],
          ),
        ),
        const SizedBox(height: 4),
        Text(desc, style: TextStyle(fontSize: 14, color: Colors.blueGrey[500])),
      ],
    );
  }
}

class _BottomCtaSection extends StatelessWidget {
  const _BottomCtaSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF1FBFF),
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF29B6F6).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Color(0xFF29B6F6),
              size: 40,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '¿Listo para visitarnos?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Agenda tu cita hoy y forma parte de la familia VetCare.',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JellyButton(
                text: 'Agendar Cita',
                onPressed: () {
                  Navigator.pushNamed(context, '/contacto');
                },
              ),
              const SizedBox(width: 16),
              OutlineHoverButton(
                text: 'Contáctanos',
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
