import 'package:flutter/material.dart';
import 'BottomNavBar.dart';  // Importa la función

class PedidosPage extends StatefulWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushNamed(context, '/categorias');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/perfil');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 2, // Número de pedidos simulados
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PedidoDetallePage(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex, _onItemTapped), // Llama la función aquí
    );
  }
}

// Página de detalles del pedido
class PedidoDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Pedido'),
      ),
      body: Center(
        child: Text('Detalles del pedido simulado'),
      ),
    );
  }
}
