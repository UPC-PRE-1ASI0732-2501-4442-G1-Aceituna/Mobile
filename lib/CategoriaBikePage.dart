import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'VehiculosModel.dart'; // tu modelo con provider
import 'CrearVehiculoPage.dart';

class CategoriaBikePage extends StatelessWidget {
  const CategoriaBikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoria = 'Bicicleta'; // usa la clave que tienes en el modelo
    final vehiculosModel = Provider.of<VehiculosModel>(context);
    final listaVehiculos = vehiculosModel.getVehiculos(categoria);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehículos'),
        backgroundColor: Colors.green,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categoría\nBike',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listaVehiculos.length,
                itemBuilder: (context, index) {
                  final vehiculo = listaVehiculos[index];
                  return _buildVehicleItem(context, vehiculo, vehiculosModel, categoria);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Agregar vehículo', style: TextStyle(fontSize: 18)),
                onPressed: () async {
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CrearVehiculoPage(categoria: 'Bicicleta'),
                    ),
                  );
                  if (resultado != null && resultado is Map<String, dynamic>) {
                    final nuevoVehiculo = resultado['vehiculo'] as Map<String, String>;
                    // Al agregar nuevo vehículo no eliminas nada
                    vehiculosModel.agregarVehiculo(categoria, nuevoVehiculo);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleItem(BuildContext context, Map<String, String> vehiculo, VehiculosModel model, String categoria) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFFFE1CC), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(width: 80, height: 80, decoration: BoxDecoration(color: const Color(0xFFFFD9A7), borderRadius: BorderRadius.circular(12))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vehiculo['nombre'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(vehiculo['tipo'] ?? ''),
                Text(vehiculo['precio'] ?? ''),
                Text(vehiculo['ubicacion'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.green),
                onPressed: () {
                  model.eliminarVehiculo(categoria, vehiculo);
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.green),
                onPressed: () async {
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrearVehiculoPage(
                        categoria: categoria,
                        vehiculoExistente: vehiculo,
                      ),
                    ),
                  );
                  if (resultado != null && resultado is Map<String, dynamic>) {
                    final nuevoVehiculo = resultado['vehiculo'] as Map<String, String>;
                    final esEdicion = resultado['editando'] as bool;

                    if (esEdicion) {
                      model.eliminarVehiculo(categoria, vehiculo);
                    }
                    model.agregarVehiculo(categoria, nuevoVehiculo);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
