import 'package:flutter/material.dart';

class CategoriaDetailPage extends StatelessWidget {
  final String categoria;

  const CategoriaDetailPage({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la categoría: $categoria'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Mostrando vehículos de la categoría: $categoria',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Aquí puedes mostrar los vehículos de la categoría $categoria.',
              style: TextStyle(fontSize: 18),
            ),
            // Agrega aquí la lógica para mostrar los vehículos (listado, crear, editar, eliminar)
          ],
        ),
      ),
    );
  }
}
