import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNavBar.dart';  // Importa la función
import 'UserModel.dart';  // Asegúrate de importar el modelo

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _nombre = '';
  String _correo = '';
  String _celular = '';
  String _tipoUsuario = '';

  // Controladores para los campos de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();  // Cargar los datos del usuario cuando la página se inicie
  }

  // Método para cargar los datos del usuario desde SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombre = prefs.getString('nombre') ?? 'Usuario no encontrado';
      _correo = prefs.getString('correo') ?? 'Correo no encontrado';
      _celular = prefs.getString('celular') ?? 'Celular no encontrado';
      _tipoUsuario = prefs.getString('tipoUsuario') ?? 'rentador'; // Puede ser 'propietario' o 'rentador'
    });

    // Actualizar los controladores con los datos almacenados
    _nombreController.text = _nombre;
    _correoController.text = _correo;
    _celularController.text = _celular;
  }

  // Método para actualizar los datos del perfil y guardarlos en SharedPreferences
  Future<void> _updateProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _nombre = _nombreController.text;
      _correo = _correoController.text;
      _celular = _celularController.text;
    });

    // Guardar los datos actualizados en SharedPreferences
    await prefs.setString('nombre', _nombre);
    await prefs.setString('correo', _correo);
    await prefs.setString('celular', _celular);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Perfil actualizado')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mostrar el ícono dependiendo del tipo de usuario
            Icon(
              _tipoUsuario == "propietario" ? Icons.home : Icons.account_balance,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            // Nombre
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            // Correo
            TextField(
              controller: _correoController,
              decoration: InputDecoration(
                labelText: 'Correo',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            // Celular
            TextField(
              controller: _celularController,
              decoration: InputDecoration(
                labelText: 'Celular',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 24),
            // Botón para actualizar el perfil
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Actualizar Perfil'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(2, (index) {  // Llama a la función correctamente
        setState(() {
          if (index == 0) {
            Navigator.pushNamed(context, '/categorias');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/pedidos');
          }
        });
      }),
    );
  }
}
