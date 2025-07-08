import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Necesario para usar ChangeNotifier
import '../CarritoModel.dart';  // Importa el modelo para el carrito

class CarritoPage extends StatelessWidget {
  const CarritoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acceder al carrito usando el proveedor
    final carrito = Provider.of<CarritoModel>(context).getCarrito();  // Obtener los vehículos en el carrito

    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.green,
      ),*/
      body: carrito.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(carrito[index]['nombre'] ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Eliminar del carrito
                      Provider.of<CarritoModel>(context, listen: false).eliminarDelCarrito(index);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/direccion');  // Navegar a la página de dirección
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
