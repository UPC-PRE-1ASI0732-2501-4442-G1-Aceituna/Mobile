import 'package:flutter/material.dart';
import '../PerfilPage.dart';
import '../BottomNavBar.dart';  // Importa la función
import 'CategoriasPage.dart';
import 'PedidosPage.dart';

class PropietarioMainPage extends StatefulWidget {
  const PropietarioMainPage({Key? key}) : super(key: key);

  @override
  _PropietarioMainPage createState() => _PropietarioMainPage();
}

class _PropietarioMainPage extends State<PropietarioMainPage> {
  int _selectedIndex = 0;  // Pestaña seleccionada

  // Lista de páginas
  final List<Widget> _pages = [
    const CategoriasPage(),
    const PedidosPage(),
    const PerfilPage(),
  ];

  // Cambiar la pestaña seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Actualiza el índice de la pestaña seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propietario'),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: _selectedIndex,  // Cambia entre las páginas según la pestaña seleccionada
        children: _pages,
      ),
      bottomNavigationBar: buildBottomNavigationBar(
        _selectedIndex,
        _onItemTapped,  // Cambia el índice al hacer click
      ),
    );
  }
}