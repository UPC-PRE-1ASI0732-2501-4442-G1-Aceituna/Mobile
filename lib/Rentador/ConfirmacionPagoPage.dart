import 'package:flutter/material.dart';

class ConfirmacionPagoPage extends StatelessWidget {
  const ConfirmacionPagoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación de Pago'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pago Confirmado', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rentador_Main_Page');
              },
              child: const Text('Finalizar Compra'),
            ),
          ],
        ),
      ),
    );
  }
}
