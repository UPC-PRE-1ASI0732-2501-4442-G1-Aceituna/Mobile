import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Necesario para usar ChangeNotifier
import '../CarritoModel.dart';  // Importa el modelo para el carrito

class DetalleVehiculoPage extends StatelessWidget {
  const DetalleVehiculoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Recuperamos los detalles del vehículo desde los argumentos
    final Map<String, String> vehicle = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // Acceder al modelo de carrito
    final carritoModel = Provider.of<CarritoModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Vehículo'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Vehículo: ${vehicle['nombre']}', // Nombre del vehículo
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Año: ${vehicle['año']}'),
            Text('Descripción: ${vehicle['descripcion']}'),
            Text('Precio: ${vehicle['precio']}'),
            Text('Número de celular: ${vehicle['celular']}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agregar al carrito
                carritoModel.agregarAlCarrito(vehicle);

                // Notificar al usuario
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vehículo agregado al carrito')),
                );

                // Volver a la página principal del Rentador (o a la página que prefieras)
                Navigator.pushNamed(context, '/rentador_Main_Page');
              },
              child: const Text('Agregar al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
