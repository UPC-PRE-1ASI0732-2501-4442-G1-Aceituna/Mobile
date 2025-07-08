import 'package:flutter/material.dart';

Widget buildBottomNavigationBar(int selectedIndex, Function(int) onItemTapped) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: onItemTapped,  // Cambia de pestaña al hacer click
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Categorías',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Pedidos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],
  );
}
