import 'package:flutter/material.dart';

class CuotasPage extends StatefulWidget {
  const CuotasPage({Key? key}) : super(key: key);

  @override
  _CuotasPageState createState() => _CuotasPageState();
}

class _CuotasPageState extends State<CuotasPage> {
  double _cuotas = 0; // Inicialmente el valor de cuotas es 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuotas'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Selecciona el número de cuotas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Slider para seleccionar cuotas de 0 a 36
            Slider(
              value: _cuotas,
              min: 0,
              max: 36,
              divisions: 36,  // Divide el rango en 36 divisiones (de 0 a 36)
              label: '${_cuotas.toInt()} cuotas',
              onChanged: (double value) {
                setState(() {
                  _cuotas = value;  // Actualiza el valor de cuotas
                });
              },
            ),

            const SizedBox(height: 20),

            // Muestra las cuotas seleccionadas
            Text(
              'Cuotas seleccionadas: ${_cuotas.toInt()}',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            // Botón para confirmar la transacción
            ElevatedButton(
              onPressed: () {
                // Navegar a la página de confirmación
                Navigator.pushNamed(context, '/confirmacion');
              },
              child: const Text('Confirmar Transacción'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Aquí usamos backgroundColor en lugar de primary
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
