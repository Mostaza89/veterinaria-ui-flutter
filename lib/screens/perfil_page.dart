import 'package:flutter/material.dart';
import '../widgets/diseno_comun.dart';
import '../widgets/botones.dart';
import '../auth_provider.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        color: Theme.of(context).colorScheme.surface,
        child: ValueListenableBuilder<UserRole?>(
          valueListenable: authProvider,
          builder: (context, role, child) {
            if (role == null) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text('Debes iniciar sesión para ver este perfil.'),
                ),
              );
            }
            if (role == UserRole.admin) {
              return const _AdminDashboard();
            }
            return const _ClientProfile();
          },
        ),
      ),
    );
  }
}

class _ClientProfile extends StatelessWidget {
  const _ClientProfile();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Info Header
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).dividerColor),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Juan Pérez',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 18,
                          color: Theme.of(context).disabledColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'juan.perez@email.com',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Icon(
                          Icons.phone_outlined,
                          size: 18,
                          color: Theme.of(context).disabledColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '+52 555 123 4567',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              OutlineHoverButton(
                text: 'Cerrar Sesión',
                icon: Icons.logout,
                onPressed: () {
                  authProvider.logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),

        // Content (Appointments & Pets)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Appointments
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Citas Pendientes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _AppointmentCard(
                    petName: 'Max (Perro)',
                    date: '10 de Marzo, 2026',
                    time: '10:00 AM',
                    reason: 'Vacunación Anual',
                  ),
                  const SizedBox(height: 16),
                  _AppointmentCard(
                    petName: 'Luna (Gato)',
                    date: '15 de Marzo, 2026',
                    time: '04:30 PM',
                    reason: 'Revisión General',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            // Right Column: Pets Medical History
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mis Mascotas e Historial',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _PetHistoryCard(
                    petName: 'Max',
                    breed: 'Golden Retriever',
                    age: '3 años',
                    history: [
                      '05/01/2026 - Consulta General: Sano.',
                      '10/06/2025 - Desparasitación completada.',
                      '12/03/2025 - Vacuna Múltiple aplicada.',
                    ],
                  ),
                  const SizedBox(height: 24),
                  _PetHistoryCard(
                    petName: 'Luna',
                    breed: 'Gato Siamés',
                    age: '1 año',
                    history: [
                      '20/02/2026 - Esterilización: Recuperación exitosa.',
                      '15/01/2026 - Vacuna Rabia aplicada.',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        const _AppointmentForm(isAdmin: false),
      ],
    );
  }
}

class _AdminDashboard extends StatefulWidget {
  const _AdminDashboard();

  @override
  State<_AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<_AdminDashboard> {
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Panel de Administrador',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            OutlineHoverButton(
              text: 'Cerrar Sesión',
              icon: Icons.logout,
              onPressed: () {
                authProvider.logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Próximas citas de hoy',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 16),
        _AppointmentCard(
          petName: 'Rocky (Perro)',
          date: 'Hoy',
          time: '08:00 AM',
          reason: 'Consulta de Emergencia',
        ),
        const SizedBox(height: 16),
        _AppointmentCard(
          petName: 'Bella (Gato)',
          date: 'Hoy',
          time: '11:00 AM',
          reason: 'Vacunación',
        ),
        const SizedBox(height: 48),
        JellyButton(
          text: _showForm
              ? 'Cerrar Formulario'
              : 'Agregar Nueva Mascota/Cliente',
          icon: _showForm ? Icons.close : Icons.add,
          onPressed: () {
            setState(() {
              _showForm = !_showForm;
            });
          },
        ),
        if (_showForm) ...[
          const SizedBox(height: 48),
          const _AppointmentForm(isAdmin: true),
        ],
      ],
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final String petName;
  final String date;
  final String time;
  final String reason;

  const _AppointmentCard({
    required this.petName,
    required this.date,
    required this.time,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.calendar_month,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reason,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Para: $petName',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PetHistoryCard extends StatelessWidget {
  final String petName;
  final String breed;
  final String age;
  final List<String> history;

  const _PetHistoryCard({
    required this.petName,
    required this.breed,
    required this.age,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.secondaryContainer,
                child: Icon(
                  Icons.pets,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$breed • $age',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Historial Médico:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 12),
          ...history.map(
            (h) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      h,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentForm extends StatefulWidget {
  final bool isAdmin;
  const _AppointmentForm({this.isAdmin = false});

  @override
  State<_AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<_AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _mascotaController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoController = TextEditingController();
  String? _selectedService;
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _nombreController.dispose();
    _mascotaController.dispose();
    _telefonoController.dispose();
    _correoController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _nombreController.clear();
      _mascotaController.clear();
      _telefonoController.clear();
      _correoController.clear();
      setState(() {
        _selectedService = null;
        _selectedDate = DateTime.now();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cita confirmada con éxito.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Theme.of(context).dividerColor),
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isAdmin ? 'Registrar Cita (Admin)' : 'Agendar Nueva Cita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    label: widget.isAdmin ? 'Nombre del Cliente' : 'Tu Nombre',
                    icon: Icons.person,
                    controller: _nombreController,
                    hint: 'Ej. Juan Pérez',
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildFormField(
                    label: widget.isAdmin
                        ? 'Nombre de la Mascota'
                        : 'Tu Mascota',
                    icon: Icons.pets,
                    controller: _mascotaController,
                    hint: 'Ej. Firulais',
                  ),
                ),
              ],
            ),
            if (widget.isAdmin) ...[
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      label: 'Teléfono',
                      icon: Icons.phone,
                      controller: _telefonoController,
                      hint: 'Ej. 555-123-4567',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildFormField(
                      label: 'Correo Electrónico',
                      icon: Icons.email,
                      controller: _correoController,
                      hint: 'Ej. cliente@correo.com',
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(
                  Icons.medical_services,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Motivo de la consulta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedService,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              hint: const Text('Selecciona un servicio...'),
              items: [
                'Medicina General',
                'Vacunación',
                'Cirugía',
                'Estética',
                'Urgencia',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => setState(() => _selectedService = val),
              validator: (val) => val == null ? 'Selecciona un servicio' : null,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Fecha Preferida',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateChanged: (DateTime newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirmar Cita',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.send, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Theme.of(context).disabledColor),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
          ),
          validator: (val) => val == null || val.isEmpty ? 'Requerido' : null,
        ),
      ],
    );
  }
}
