import 'package:flutter/material.dart';

class DireccionPage extends StatelessWidget {
  const DireccionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dirección de Entrega'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Dirección',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pago');
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
