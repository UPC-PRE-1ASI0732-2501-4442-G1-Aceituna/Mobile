// CrearVehiculoPage.dart
import 'package:flutter/material.dart';

class CrearVehiculoPage extends StatefulWidget {
  final String categoria;
  final Map<String, String>? vehiculoExistente;

  const CrearVehiculoPage({
    Key? key,
    required this.categoria,
    this.vehiculoExistente,
  }) : super(key: key);

  @override
  State<CrearVehiculoPage> createState() => _CrearVehiculoPageState();
}

class _CrearVehiculoPageState extends State<CrearVehiculoPage> {
  late TextEditingController nombreController;
  late TextEditingController descripcionController;
  late TextEditingController precioController;
  late TextEditingController anioController;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.vehiculoExistente?['nombre'] ?? '');
    descripcionController = TextEditingController(text: widget.vehiculoExistente?['descripcion'] ?? '');
    // Removemos el prefijo 'S/. ' si existe para solo tener el número
    String precioTexto = widget.vehiculoExistente?['precio']?.replaceAll('S/. ', '') ?? '';
    precioController = TextEditingController(text: precioTexto);
    anioController = TextEditingController(text: widget.vehiculoExistente?['anio'] ?? '');
  }

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    anioController.dispose();
    super.dispose();
  }

  void _guardarVehiculo() {
    if (nombreController.text.trim().isEmpty ||
        precioController.text.trim().isEmpty ||
        anioController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor llena los campos obligatorios')),
      );
      return;
    }

    final vehiculo = {
      'nombre': nombreController.text.trim(),
      'tipo': widget.categoria == 'Scooter' ? 'Scooter Eléctrico' : 'Bicicleta',
      'precio': 'S/. ${precioController.text.trim()}',
      'ubicacion': 'Lima, Peru',
      'descripcion': descripcionController.text.trim(),
      'anio': anioController.text.trim(),
    };

    Navigator.pop(context, {'vehiculo': vehiculo, 'editando': widget.vehiculoExistente != null});
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.vehiculoExistente != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar vehículo' : 'Nuevo vehículo'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            const Icon(Icons.folder_shared_outlined, size: 120, color: Colors.black),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.categoria,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: nombreController,
              label: 'Nombre *',
              hint: 'Nombre del vehículo',
              icon: Icons.align_horizontal_left_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: descripcionController,
              label: 'Descripción',
              hint: 'Descripción',
              icon: Icons.description_outlined,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: precioController,
                    label: 'Precio *',
                    hint: '00.00',
                    icon: Icons.attach_money_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: anioController,
                    label: 'Año *',
                    hint: '2000',
                    icon: Icons.timer_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: Text(isEditing ? 'Guardar cambios' : 'Crear vehículo', style: const TextStyle(fontSize: 18)),
                onPressed: _guardarVehiculo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
