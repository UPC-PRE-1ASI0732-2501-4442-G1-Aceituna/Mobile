import 'package:flutter/material.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Pago'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Número de tarjeta',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del titular',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mes/Año de expiración',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Código de seguridad (CVV)',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'DNI',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cuotas');
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
