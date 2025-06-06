import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WelcomePage.dart';  // Cambiado de LoginPage a WelcomePage
import 'CategoriasPage.dart'; // Página de Categorías
import 'PedidosPage.dart'; // Página de Pedidos
import 'PerfilPage.dart'; // Página de Perfil
import 'RegisterPage.dart';
import 'RolPage.dart';  // Página para seleccionar el Rol
import 'CategoriaBikePage.dart';  // Página para la categoría Bike
import 'CategoriaScooterPage.dart';  // Página para la categoría Scooter
import 'VehiculosModel.dart'; // Para gestionar los vehículos

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => VehiculosModel(),
      child: const EcoMovilApp(),
    ),
  );
}

class EcoMovilApp extends StatefulWidget {
  const EcoMovilApp({Key? key}) : super(key: key);

  @override
  _EcoMovilAppState createState() => _EcoMovilAppState();
}

class _EcoMovilAppState extends State<EcoMovilApp> {
  int _selectedIndex = 0;  // Pestaña seleccionada

  // Lista de las páginas de las pestañas
  final List<Widget> _pages = [
    const CategoriasPage(),  // Página Categorías
    const PedidosPage(),     // Página Pedidos
    const PerfilPage(),      // Página Perfil
  ];

  // Cambiar la pestaña seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMovil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/', // Ruta inicial, empieza desde WelcomePage

      routes: {
        '/': (context) => const WelcomePage(),  // Página de Bienvenida (antes LoginPage)
        '/register': (context) => const RegisterPage(),
        '/rol': (context) => const RolPage(), // Ruta para seleccionar el Rol
        '/categorias': (context) => const CategoriasPage(),
        '/categoria_bike': (context) => const CategoriaBikePage(),  // Nueva ruta para Bike
        '/categoria_scooter': (context) => const CategoriaScooterPage(),  // Nueva ruta para Scooter
        '/pedidos': (context) => const PedidosPage(),  // Ruta de Pedidos
        '/perfil': (context) => const PerfilPage(),  // Ruta de Perfil
      },
    );
  }
}
