import 'package:flutter/material.dart';
//import '../BottomNavBar.dart';  // Importa la función

class PedidosPage extends StatelessWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulando los pedidos
    final List<Map<String, String>> pedidos = [
      {
        'fecha': '2024-08-06 12:50:00',
        'cliente': 'David Esteban Martinez',
        'direccion': 'Av. Siempre Viva 123',
        'celular': '9876543210',
        'total': '\$100',
      },
      {
        'fecha': '2024-08-06 14:30:00',
        'cliente': 'Ana Maria Torres',
        'direccion': 'Calle Ficticia 456',
        'celular': '9876543211',
        'total': '\$150',
      },
    ];

    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.green,
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pedidos.length, // Número de pedidos
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.shopping_cart, color: Colors.green),
                title: Text('Orden #${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fecha: ${pedidos[index]['fecha']}'),
                    Text('Cliente: ${pedidos[index]['cliente']}'),
                    Text('Total: ${pedidos[index]['total']}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Navegar a la página de detalles del pedido y pasar los detalles
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PedidoDetallePage(),
                      settings: RouteSettings(
                        arguments: pedidos[index], // Pasamos los datos del pedido
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// Página de detalles del pedido
class PedidoDetallePage extends StatelessWidget {
  const PedidoDetallePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulando los detalles del pedido
    final Map<String, String> pedido = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Pedido'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del pedido
            Text(
              'Fecha de Pedido: ${pedido['fecha']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Cliente: ${pedido['cliente']}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Dirección de entrega: ${pedido['direccion']}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Número de celular: ${pedido['celular']}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Total: ${pedido['total']}', style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            // Botón para confirmar entrega
            ElevatedButton(
              onPressed: () {
                // Volver a la página de categorías
                Navigator.pushNamed(context, '/propietario_Main_Page');
              },
              child: const Text('Entregar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,  // Color del botón
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