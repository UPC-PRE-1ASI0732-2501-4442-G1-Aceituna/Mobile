import 'package:flutter/material.dart';

class VehiculosModel extends ChangeNotifier {
  final Map<String, List<Map<String, String>>> _vehiculosPorCategoria = {
    'Scooter': [
      {
        'nombre': 'Max E.',
        'tipo': 'Scooter Eléctrico',
        'precio': 'S/. 15',
        'ubicacion': 'Lima, Peru',
        'descripcion': '',
        'anio': '',
      }
    ],
    'Bicicleta': [
      {
        'nombre': 'Mountain Rider',
        'tipo': 'Bicicleta de Montaña',
        'precio': 'S/. 25',
        'ubicacion': 'Cusco, Peru',
        'descripcion': '',
        'anio': '',
      }
    ],
  };

  List<Map<String, String>> getVehiculos(String categoria) {
    return _vehiculosPorCategoria[categoria] ?? [];
  }

  void agregarVehiculo(String categoria, Map<String, String> vehiculo) {
    if (_vehiculosPorCategoria[categoria] == null) {
      _vehiculosPorCategoria[categoria] = [];
    }
    _vehiculosPorCategoria[categoria]!.add(vehiculo);
    notifyListeners();
  }

  void eliminarVehiculo(String categoria, Map<String, String> vehiculo) {
    _vehiculosPorCategoria[categoria]?.remove(vehiculo);
    notifyListeners();
  }

  void actualizarVehiculo(String categoria, Map<String, String> viejoVehiculo, Map<String, String> nuevoVehiculo) {
    final lista = _vehiculosPorCategoria[categoria];
    if (lista == null) return;
    final index = lista.indexOf(viejoVehiculo);
    if (index != -1) {
      lista[index] = nuevoVehiculo;
      notifyListeners();
    }
  }
}
