import 'package:flutter/material.dart';
import 'CarritoPage.dart';
import '../PerfilPage.dart';
import 'CategoríasPageRentador.dart'; // Asegúrate de que estas páginas existan
import '../BottomNavBarRentador.dart';  // Importa la función

class RentadorMainPage extends StatefulWidget {
  const RentadorMainPage({Key? key}) : super(key: key);

  @override
  _RentadorMainPageState createState() => _RentadorMainPageState();
}

class _RentadorMainPageState extends State<RentadorMainPage> {
  int _selectedIndex = 0;  // Pestaña seleccionada

  // Lista de páginas
  final List<Widget> _pages = [
    const CategoriasPageRentador(),
    const CarritoPage(),
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
        title: const Text('Rentador'),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: _selectedIndex,  // Cambia entre las páginas según la pestaña seleccionada
        children: _pages,
      ),
      bottomNavigationBar: buildBottomNavigationBarRentador(
        _selectedIndex,
        _onItemTapped,  // Cambia el índice al hacer click
      ),
    );
  }
}