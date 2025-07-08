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
            // Emojis o imagen creativa para dar un toque visual
            const Text(
              '🎉 Pago Confirmado 🛒',  // Emoji de celebración y carrito de compras
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Mensaje adicional para más claridad
            const Text(
              'Tu pago ha sido procesado exitosamente.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            // Botón de finalizar compra
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rentador_Main_Page'); // Redirige al Rentador Main Page
              },
              child: const Text('Finalizar Compra'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
