import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({Key? key}) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  // Simulando el carrito
  List<String> carrito = ['Bicicleta 1', 'Scooter 1'];

  // Método para eliminar un vehículo del carrito
  void _eliminarDelCarrito(int index) {
    setState(() {
      carrito.removeAt(index); // Eliminar el vehículo de la lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.green,
      ),*/
      body: ListView.builder(
        itemCount: carrito.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(carrito[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _eliminarDelCarrito(index); // Llamamos a la función de eliminación
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/direccion');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
