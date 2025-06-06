import 'package:flutter/material.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 5, // Número de pedidos
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.shopping_cart, color: Colors.green),
                title: Text('Orden #${index + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pedido 2024-08-06 T2:50:00'),
                    Text('Cliente: David Esteban Martinez'),
                    Text('Estado: Pagado'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Acción para ver detalles del pedido
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
