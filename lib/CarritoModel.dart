import 'package:flutter/material.dart';

class CarritoModel extends ChangeNotifier {
  // Lista para almacenar los vehículos agregados al carrito
  List<Map<String, String>> carrito = [];

  // Método para agregar un vehículo al carrito
  void agregarAlCarrito(Map<String, String> vehiculo) {
    carrito.add(vehiculo);
    notifyListeners();  // Notificar a los widgets que escuchan para actualizar la UI
  }

  // Método para eliminar un vehículo del carrito
  void eliminarDelCarrito(int index) {
    carrito.removeAt(index);
    notifyListeners();  // Notificar a los widgets que escuchan para actualizar la UI
  }

  // Obtener los vehículos en el carrito
  List<Map<String, String>> getCarrito() {
    return carrito;
  }
}
