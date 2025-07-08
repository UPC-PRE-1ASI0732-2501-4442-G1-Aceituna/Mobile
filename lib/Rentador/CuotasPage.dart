import 'package:flutter/material.dart';

class CuotasPage extends StatelessWidget {
  const CuotasPage({Key? key}) : super(key: key);

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
            const Text('Selecciona el número de cuotas'),
            // Selector de cuotas (puedes usar un Dropdown o un Slider)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/confirmacion');
              },
              child: const Text('Confirmar Transacción'),
            ),
          ],
        ),
      ),
    );
  }
}
