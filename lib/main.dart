import 'package:ecomovil/Rentador/CategoriaScooterPageRentador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WelcomePage.dart';  // Cambiado de LoginPage a WelcomePage
import 'Propietario/CategoriasPage.dart'; // Página de Categorías
import 'Propietario/PedidosPage.dart'; // Página de Pedidos
import 'PerfilPage.dart'; // Página de Perfil
import 'RegisterPage.dart';
import 'RolPage.dart';  // Página para seleccionar el Rol
import 'Propietario/CategoriaBikePage.dart';  // Página para la categoría Bike
import 'Propietario/CategoriaScooterPage.dart';  // Página para la categoría Scooter
import 'Propietario/VehiculosModel.dart'; // Para gestionar los vehículos
import 'Rentador/CarritoPage.dart';
import 'Rentador/CategoríasPageRentador.dart';
import 'Rentador/CategoriaBikePageRentador.dart';
import 'Rentador/ConfirmacionPagoPage.dart';
import 'Rentador/CuotasPage.dart';
import 'Rentador/DetalleVehiculoPage.dart';
import 'Rentador/DireccionPage.dart';
import 'Rentador/PagoPage.dart';
import 'Rentador/RentadorMainPage.dart';
import 'Propietario/PropietarioMainPage.dart';

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
        '/categoriasRentador': (context) => const CategoriasPageRentador(),
        '/categoria_bike': (context) => const CategoriaBikePage(),  // Nueva ruta para Bike
        '/categoria_scooter': (context) => const CategoriaScooterPage(),  // Nueva ruta para Scooter
        '/detalle_vehiculo': (context) => const DetalleVehiculoPage(),
        '/carrito': (context) => const CarritoPage(),
        '/direccion': (context) => const DireccionPage(),
        '/pago': (context) => const PagoPage(),
        '/cuotas': (context) => const CuotasPage(),
        '/confirmacion': (context) => const ConfirmacionPagoPage(),
        '/pedidos': (context) => const PedidosPage(),  // Ruta de Pedidos
        '/perfil': (context) => const PerfilPage(),  // Ruta de Perfil
        '/categoria_bike_Rentador': (context) => const CategoriaBikePageRentador(),  // Nueva ruta para Bike
        '/categoria_scooter_Rentador': (context) => const CategoriaScooterPageRentador(),  // Nueva ruta para Scooter
        '/rentador_Main_Page': (context) => const RentadorMainPage(),  // Nueva ruta para Scooter
        '/propietario_Main_Page': (context) => const PropietarioMainPage(),  // Nueva ruta para Scooter
      },
    );
  }
}
