import 'package:flutter/material.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      child: Column(
        children: [
          _HeroBlogSection(),
          _CategoriesSection(),
          _BlogGridSection(),
          _PaginationSection(),
          _NewsletterSection(),
        ],
      ),
    );
  }
}

class _HeroBlogSection extends StatelessWidget {
  const _HeroBlogSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Icons.energy_savings_leaf,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'BLOG DE BIENESTAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
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
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      height: 1.1,
                      fontFamily: 'Roboto',
                    ),
                    children: [
                      TextSpan(text: 'Cuidado Animal\n'),
                      TextSpan(
                        text: 'Bajo Cielos Azules',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Descubre consejos brillantes, guías de hidratación y todo lo\nnecesario para mantener a tu mascota feliz y saludable con\nun toque refrescante.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80&w=800&h=600',
                    fit: BoxFit.cover,
                    height: 350,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: -20,
                  left: -30,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFE8F5E9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Artículo Destacado',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.color,
                              ),
                            ),
                            Text(
                              'Hidratación Vital',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class _CategoriesSection extends StatefulWidget {
  const _CategoriesSection();

  @override
  State<_CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<_CategoriesSection> {
  int _selectedIndex = 0;
  final List<String> _categories = [
    'Todos',
    'Nutrición',
    'Salud',
    'Higiene',
    'Comportamiento',
    'Estilo de Vida',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_categories.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                right: index == _categories.length - 1 ? 0 : 16.0,
              ),
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: _CategoryChip(
                  text: _categories[index],
                  isSelected: _selectedIndex == index,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _CategoryChip({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                )
              : Border.all(color: Theme.of(context).dividerColor, width: 1.5),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _BlogGridSection extends StatelessWidget {
  const _BlogGridSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      color: Theme.of(context).cardColor,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
        childAspectRatio: 0.8,
        children: [
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Salud',
            date: '12 Oct, 2023',
            readTime: '5 min lectura',
            title: 'La Importancia de la Hidratación Diaria',
            desc:
                'El agua fresca es vital para el funcionamiento renal de tu mascota. Descubre cómo fomentar el consumo de agua.',
          ),
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Estilo de Vida',
            date: '10 Oct, 2023',
            readTime: '3 min lectura',
            title: 'Paseos bajo el Sol: Guía Segura',
            desc:
                'Cómo proteger las almohadillas de tu perro en días soleados y evitar golpes de calor durante el ejercicio.',
          ),
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1573865526739-10659fec78a5?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Nutrición',
            date: '08 Oct, 2023',
            readTime: '6 min lectura',
            title: 'Nutrición para Pelajes Brillantes',
            desc:
                'Los ácidos grasos Omega-3 y Omega-6 son esenciales. Descubre qué alimentos hacen brillar a tu mascota.',
          ),
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Ejercicio',
            date: '05 Oct, 2023',
            readTime: '4 min lectura',
            title: 'El Cielo es el Límite: Ejercicio',
            desc:
                'Actividades al aire libre para gatos y perros que estimulan tanto su mente como su cuerpo.',
          ),
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Higiene',
            date: '01 Oct, 2023',
            readTime: '7 min lectura',
            title: 'Baños Refrescantes: Tips',
            desc:
                'Haciendo del baño una experiencia relajante y divertida para mascotas que temen al agua.',
          ),
          _BlogCard(
            imageUrl:
                'https://images.unsplash.com/photo-1522276498395-f4f68f7f8454?auto=format&fit=crop&q=80&w=600&h=400',
            category: 'Diversión',
            date: '28 Sep, 2023',
            readTime: '4 min lectura',
            title: 'Juguetes Seguros y Divertidos',
            desc:
                'Eligiendo lo mejor para su entretenimiento, evitando materiales tóxicos o piezas pequeñas peligrosas.',
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatefulWidget {
  final String imageUrl;
  final String category;
  final String date;
  final String readTime;
  final String title;
  final String desc;

  const _BlogCard({
    required this.imageUrl,
    required this.category,
    required this.date,
    required this.readTime,
    required this.title,
    required this.desc,
  });

  @override
  State<_BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<_BlogCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
          boxShadow: _isHovering
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.readTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'Leer más',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
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

class _PaginationSection extends StatefulWidget {
  const _PaginationSection();

  @override
  State<_PaginationSection> createState() => _PaginationSectionState();
}

class _PaginationSectionState extends State<_PaginationSection> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Theme.of(context).cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (_currentPage > 1) setState(() => _currentPage--);
            },
            child: const _PageDot(text: '<', isActive: false),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _currentPage = 1),
            child: _PageDot(text: '1', isActive: _currentPage == 1),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _currentPage = 2),
            child: _PageDot(text: '2', isActive: _currentPage == 2),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _currentPage = 3),
            child: _PageDot(text: '3', isActive: _currentPage == 3),
          ),
          const SizedBox(width: 8),
          Text('...', style: TextStyle(color: Colors.blueGrey)),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _currentPage = 8),
            child: _PageDot(text: '8', isActive: _currentPage == 8),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (_currentPage < 8) setState(() => _currentPage++);
            },
            child: const _PageDot(text: '>', isActive: false),
          ),
        ],
      ),
    );
  }
}

class _PageDot extends StatelessWidget {
  final String text;
  final bool isActive;

  const _PageDot({required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).cardColor,
          shape: BoxShape.circle,
          border: isActive
              ? Border.all(color: Theme.of(context).colorScheme.secondary)
              : Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive
                ? Theme.of(context).cardColor
                : Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _NewsletterSection extends StatelessWidget {
  const _NewsletterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                const SizedBox(height: 16),
                Text(
                  'Comprometidos con el bienestar de tu\nmascota a través de la medicina\nmoderna y el cuidado compasivo. Tu\nmejor amigo merece lo mejor.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _SocialIcon(Icons.facebook, Colors.blue),
                    const SizedBox(width: 12),
                    _SocialIcon(Icons.camera_alt, Colors.pink),
                    const SizedBox(width: 12),
                    _SocialIcon(Icons.business_center, Colors.indigo),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explora',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const SizedBox(height: 24),
                _FooterLink('Sobre Nosotros'),
                _FooterLink('Nuestros Veterinarios'),
                _FooterLink('Casos de Éxito'),
                _FooterLink('Ubicaciones'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Servicios',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const SizedBox(height: 24),
                _FooterLink('Consulta General'),
                _FooterLink('Vacunación'),
                _FooterLink('Peluquería & Spa'),
                _FooterLink('Urgencias 24h'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Newsletter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Recibe tips para tu mascota\ndirectamente en tu bandeja de entrada.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'tucorreo@ejemplo.com',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: JellyButton(text: 'Suscribirme', onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(icon, color: Theme.of(context).cardColor, size: 20),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;

  const _FooterLink(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 14,
        ),
      ),
    );
  }
}
