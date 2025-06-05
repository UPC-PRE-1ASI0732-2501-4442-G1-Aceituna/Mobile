import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WelcomePage.dart';
import 'RegisterPage.dart';
import 'RolPage.dart';
import 'CategoriasPage.dart';
import 'CategoriaScooterPage.dart';
import 'CategoriaBikePage.dart'; // Asegúrate de crear esta página
import 'CrearVehiculoPage.dart'; // Asegúrate de crear esta página
import 'VehiculosModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => VehiculosModel(),
      child: const EcoMovilApp(),
    ),
  );
}

class EcoMovilApp extends StatelessWidget {
  const EcoMovilApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMovil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/register': (context) => const RegisterPage(),
        '/rol': (context) => const RolPage(),
        '/categorias': (context) => const CategoriasPage(),
        '/categoria_scooter': (context) => const CategoriaScooterPage(),
        '/categoria_bike': (context) => const CategoriaBikePage(), // crea esta pantalla similar a scooter
        '/crear_vehiculo': (context) => CrearVehiculoPage(categoria: 'Default'),
      },
    );
  }
}
