import 'package:flutter/material.dart';
//import '../BottomNavBarRentador.dart';  // Importa la función

class CategoriaScooterPageRentador extends StatelessWidget {
  const CategoriaScooterPageRentador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulando una lista de vehículos disponibles
    final List<Map<String, String>> vehicles = [
      {
        'nombre': 'Scooter 1',
        'año': '2022',
        'descripcion': 'Scooter eléctrico de alta eficiencia.',
        'precio': '\$20/día',
        'celular': '9876543210',
      },
      {
        'nombre': 'Scooter 2',
        'año': '2021',
        'descripcion': 'Scooter perfecto para recorridos urbanos.',
        'precio': '\$25/día',
        'celular': '9876543211',
      },
      {
        'nombre': 'Scooter 3',
        'año': '2023',
        'descripcion': 'Scooter de última tecnología con batería de larga duración.',
        'precio': '\$30/día',
        'celular': '9876543212',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scooters'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categoría\nScooters',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  return _buildVehicleItem(context, vehicles[index]);
                },
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: buildBottomNavigationBarRentador(0, (index) {
        // Lógica para cambiar entre las páginas de la barra de navegación}),
    );
  }

  // Widget para cada ítem de la lista de vehículos (Scooters)
  Widget _buildVehicleItem(BuildContext context, Map<String, String> vehicle) {    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE1CC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Imagen del vehículo (aquí usas una imagen estática o dinámica dependiendo de tu aplicación)
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD9A7),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16),
          // Detalles del vehículo
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle['nombre'] ?? '', // Nombre del vehículo
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text('Año: ${vehicle['año']}'),
                Text('Precio: ${vehicle['precio']}'),
                Text('Ubicación: Local 1', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          // Al hacer tap en el vehículo, se navega a los detalles
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.green),
            onPressed: () {
              Navigator.pushNamed(context, '/detalle_vehiculo', arguments: vehicle);
            },
          ),
        ],
      ),
    );
  }
}
